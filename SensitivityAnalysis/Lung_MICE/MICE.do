/////////////////////////////////////////////////
// Multiple Imputation 
/////////////////////////////////////////////////

clear
cd "/Users/MALF/Dropbox/MiguelJavier/R/Lung/MICE"
use FinalLung.dta
set seed 12345
describe
drop surgery cirugia aids hist icdo3t idcase idpz
rename gender sex 
rename LocAdv stage
tab stage, miss
count

* Setting time to get nonparametric cumulative Hazard

stset datefoll, fail(status==2) origin(time datainci) exit(time datefoll) scale(30) //note here 7 years
sts graph
sts gen H = na
 
* Setting MICE
misstable summarize
mi set flong
mi register imputed stage smoker // variables with missing values
mi register regular age sex H _d // variables that are not to be imputed

mi impute chained (mlogit) stage (mlogit) smoker = age sex H _d, add(5) force noisily // Fully conditional specification

save "/Users/MALF/Dropbox/MiguelJavier/R/CRC/NoBMI/NoSmoking/EarlyStage/MICE/CRCimputed.dta"

