/////////////////////////////////////////////////
// Multiple Imputation 
/////////////////////////////////////////////////

clear
cd "/Users/MALF/Dropbox/MiguelJavier/R/CRC/NoBMI/NoSmoking/EarlyStage"
use CRC.dta
set seed 12345
describe
drop bmi smoker
tab stage, miss
count

* Data management dates 
gen dci  = date(datainci, "DMY") //date cancer incidence
replace dci  = date(datainci, "DMYhms") if dci == .
format dci %td

gen dof = date(datefoll, "DMY") //last date cancer patient follow-up
gen datefoll2 = datefoll
replace datefoll2 = string(real(datefoll),"%08.0f")
replace dof  = date(datefoll2, "DMY") if dof == .
replace dof  = date(datefoll, "DMYhms") if dof == .
format dof %td

drop datefoll2 datefoll datainci
describe

* Setting time to get nonparametric cumulative Hazard

stset dof, fail(status==1) origin(time dci) exit(time dof) scale(30) 
sts graph
sts gen H = na
 
* Setting MICE
misstable summarize
mi set flong
mi register imputed stage infarct heart_failure vascular_disease cerebro_disease pulmonary_disease renal_disease diabetes liver // variables with missing values
mi register regular age sex H _d // variables that are not to be imputed

mi impute chained (mlogit) stage (logit) infarct (logit) heart_failure (logit) vascular_disease (logit) cerebro_disease (logit) pulmonary_disease (logit) renal_disease (logit) diabetes (logit) liver = age sex H _d, add(5) force noisily // Fully conditional specification

save "/Users/MALF/Dropbox/MiguelJavier/R/CRC/NoBMI/NoSmoking/EarlyStage/MICE/CRCimputed.dta"

