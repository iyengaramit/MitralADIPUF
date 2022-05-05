# MitralADIPUF
Neighborhood Socioeconomic Status Independently Predicts Outcomes After Mitral Valve Surgery: A Society of Thoracic Surgeons’ National Database Study

Initial dataset provided according to the Participant User File (PUF) mechanism by the STS Research Center, queried from the STS Adult Cardiac Surgery Database (ACSD) between January 1st, 2010 – March 31st,  2019. Query was performed across four data collection forms (2.61, 2.73, 2.81, and 2.9). Initial query filters from the Research Center were broad and included all patients undergoing the following:
•	Patients undergoing isolated mitral valve repair (MVr) and mitral valve replacement (MVR) as defined by the STS (notably, includes concomitant tricuspid intervention, atrial septal defect closure, and/or ablation procedure)
•	Patients undergoing concomitant coronary artery bypass grafting and MVr/R
•	Patients undergoing other cardiac surgery who have unplanned MVr/R as a part of their index procedure
In this way, initial data provided was meant to be as broad as possible. Query included a majority of variables in the following data collection form sections: Demographics, Hospitalization, Risk Factors, Previous Cardiac Interventions, Preoperative Cardiac Status, Preoperative Medications, Hemodynamics/Cath/Echo, Operative, Valve Surgery, Post-Operative, Postoperative Events, Discharge/Mortality, and Readmission.
Given the paucity of socioeconomic status (SES) information captured in the ACSD, additional means of assessing SES were sought. In particular, the Area Deprivation Index (ADI), a multifactorial neighborhood-based metric, was queried given a readily available linkage to patient’s home address by the STS Research Center. ADI is a geographically-based metric developed and validated by Kind et al incorporating data from American Community Survey Five Year Estimates and US Census data. The ADI had been refined and adapted to the US Census Block Group level by Kind and colleagues over several decades, and includes 17 individually weighted factors assessing domains including employment, income, housing and education. It has been validated as predictive of outcomes in a variety healthcare settings, including recent studies in cardiac surgical literature. ADI data for a particular census block group is publicly available online at www.neighborhoodatlas.medicine.wisc.edu. Data is summarized into national percentile rankings at a block level group from 1 to 100, where a higher percentile denotes a higher level of “disadvantage”. 
Utilizing location data available in the ACSD, each patient was geotagged and matched to a unique Federal Information Processing Standard (FIPS) code using 2017 TIGER-Line shapefiles available through the US Census Bureau via ArcGIS software (Esri, Redlands, CA). Location data was available at varying levels of “precision” (street address, range, zip code, or city), and the geographic centroid was computed when ranged precision present. Utilizing the unique FIPS codes for each patient, ADI was queried from the Online Neighborhood Atlas. Identifying location information was NOT shared with our research team, and all geotagging and ADI calculations were performed by the STS Research Center and provided to our research team in a deidentified fashion. The national ADI percentile as calculated via 2014-2018 Census data (ADI2018). 
Potential mechanisms by which socioeconomic status might plausibly impact outcomes after mitral valve surgery are numerous. Potential effects may include but are certainly not limited to an uneven distribution of comorbidities, differing specific mitral valve pathologies and acuity of presentation, delay in receiving care, access to care, ability to seek mitral centers of excellence, financial constraints, and implicit bias. As available within the data extracted from the STS Adult Cardiac Surgery Database (ACSD), attempts were made to quantify some of these effects and discern the potential effector of SES on outcomes. Patient race, payor information, and presenting characteristics are readily provided in demographics across all data collection forms. Specific mitral valve pathologic information is present to varying levels of precision across data collection forms and was consolidated into several groups as detailed below. As a potential surrogate measure of access to care, we sought to concomitantly estimate the travel burden that patients underwent to receive their mitral surgery. This was estimated as the distance between patient home and center which surgery took place. Utilizing location data with prespecified precision information as above, driving distance was computed via a Google Maps Distance Matrix Application Programming Interface available from Google Maps (Mountain View, CA). Similarly, when precision to exact street address was unavailable, the geographic centroid of available range was utilized for patient location. Again, queries for location and ADI information were performed by the STS Research Center and deidentified, non-localizable data was provided to our research staff as outlined in our data use agreement. 

Variable Coding
All variables received from the STS Research Center were re-coded for statistical analysis. Full statistical code detailing variable transformations is provided in the Supplement. Wherever possible, variables were re-coded in congruence with the strategy employed by the STS 2018 Risk Model statistical analytic strategy. 
Age - Modeled as a piecewise linear function with slope changes at 50, 60, and 75 years.
ADI – Linear, quadratic, cubic modeling utilized as detailed below (values 0-100)
Ejection fraction - Modeled as linear. Values > 50 are mapped to 50. 
Body surface area (BSA) - Quadratic polynomial, BSA values < 1.4 and > 2.6 are mapped to 1.4 and 2.6, respectively.
Body mass index (BMI) - Modeled as quadratic polynomial. Values < 18 and > 50 are mapped to 18 and 50, respectively.
Sex - Binary (male/female).
Dialysis – Binary (Yes/No)
Creatinine - Modeled as a piecewise linear function with a slope change at 1.5mg/dL. Values <0.5 or >5.0 are mapped to 0.5 and 5.0, respectively. 
Hematocrit - Quadratic polynomial, values < 25 and > 50 are mapped to 25 and 50, respectively.
White blood cells - Piecewise linear function with slope changes at 6.6 and 8.5. Values < 3.6 and > 18 are mapped to 3.6 and 18, respectively.
Platelets - Modeled as a quadratic polynomial. Values < 80,000 and > 425,000 are mapped to 80,000 and 425,000, respectively.
Hypertension - Binary.
Immunosuppressive therapy within 30 days - Binary
Inotropes within 48 hours -  Binary
Preoperative intra-aortic balloon pump (IABP) - Binary
Shock/ECMO/CBA - Binary. Defined as shock at time of procedure or preoperative extracorporeal membrane oxygenation (ECMO) or preoperative catheter-based assist device (CBA). 
Peripheral arterial disease (PAD) - Binary
Left main disease – Binary
Proximal LAD - Binary
Mitral stenosis - Binary
Aortic stenosis - Binary
Aortic insufficiency - 3 groups: (1) None/trace/trivial/mild (2) Moderate (3) Severe
Mitral insufficiency - 3 groups: (1) None/trace/trivial/mild (2) Moderate (3) Severe
Tricuspid insufficiency - 3 groups: (1) None/trace/trivial/mild (2) Moderate (3) Severe
Mitral Etiology – 10 groups: (1) degenerative, (2) endocarditis, (3) rheumatic, (4) ischemic, (5) congenital, (6) hypertrophic obstructive cardiomyopathy, (7) tumor, (8) trauma, (9) non-ischemic cardiomyopathy, (10) other
Tricuspid Etiology – 6 groups: (1) functional, (2) endocarditis, (3) congenital, (4) tumor, (5) trauma, (6) other
Arrhythmia - Binary
Endocarditis - Binary: (0) none, (1) treated OR active
Chronic lung disease - 4 groups: (1) none, (2) mild, (3) moderate, (4) severe
CVA/TIA - Binary
Alcohol consumption (drinks per week) - 3 categories (1) 0 - 1 (2) 2-7 (3) >=8
Diabetes / diabetes control method - 5 groups: (1) none, (2) diabetes with no control (3) diabetes with diet or other as control, (4) diabetes with oral control, (5) diabetes with insulin control
Cardiac presentation on admission - 5 groups: (1) No symptoms or symptoms unlikely to be ischemia (2) stable angina (3) unstable angina (4) Non-STEMI (5) STEMI
Race / ethnicity - 5 groups: (1) black, (2) Asian, (3) White (4) Other
Status - 4 groups: (1) elective, (2) urgent, (3) emergent, no resuscitation, (4) salvage or emergent with resuscitation
Heart failure – Binary (NYHA Class IV vs no).
Liver disease - Binary
PCI history – Binary (Prior PCI vs. none)
Payer / insurance type - 10 groups: assign to first category for which criteria are met:
(1) Age 65+, Medicare + Medicaid, dual eligible, (2) Age 65+, Medicare, (3) Age 65+, Commercial or HMO, (4) Age 65+, Medicaid/Other, (5) Age <65, Medicaid + Medicare; (6) Age <65, Medicaid, (7) Age <65, Medicare, (8) Age <65, Commercial or HMO, (9) Age <65, Self/none as only payor, (10) Age <65, other
Tricuspid valve repair performed concomitantly with mitral operation – Binary
Annual Surgeon Volume – grouped into incremental groups of 5 (1-5, 6-10, 11-15, 16-20, etc). All those > 100 were placed in the final group. 
Inclusion/Exclusion Criteria
After receipt of the data from the Research Center and requisite variable re-coding as necessary, pre-specific exclusion criteria were first applied.  A CONSORT diagram towards the final analytic cohort is detailed in Figure 1. Initial query revealed 378,570 patients. Adolescent patients (Age < 18) were excluded (N = 2,973), and those with data utilizing data collection form 2.6 (April 2011 and prior) were further excluded given inconsistencies between forms that limit variable definitions (N = 59,304). For clean assessments of annual volume, the cohort was further refined exclude those patients in 2011 and 2019 (N=28,603). 
Prior to additional exclusion criteria application, assessments of annual volume for each site, hospital, and surgeon according to unique, deidentified STS ID codes was made. The rationale for applying this prior to additional exclusion criteria was based on the assumption that all mitral valve surgery may provide relevant expertise in mitral surgery, regardless of etiology or concomitant surgical interventions – an assumption shared by previous authors in the literature. Following this, patients with previous coronary artery bypass (N=17,359) or valvular (N=26,222) surgical procedures were excluded. Other previous surgical interventions (N=7,180) were further excluded. In order to isolate a more uniform population, additional planned concomitant procedures outside of those included in the STS definition of isolate mitral valve surgery were excluded. The rationale for this exclusion was the emphasis that the modeling strategy places on existing 2018 STS Adult Cardiac Surgery Risk Model for isolated mitral valve surgery. Namely, concomitant planned CABG (N=69,753), aortic valve (N=29,375), or other (N=702) cardiac surgeries were excluded.  
Ultimately, this yielded a final analytic cohort of 137,100 patients. For transparency of all variable definitions and case exclusions, source code for all variable re-coding and data refinement is provided in Supplemental code file.
