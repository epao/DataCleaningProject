# Code Book for Coursera Getting and Cleaning Data Final Assignment

## Raw Data
The data is provided from the UCI data repository. It contains sensor signals for 30 subjects from a Samsung Galaxy S smartphone. Each subject performed six activities and the dataset provides measurements (of each sensor signal).

For each record, the dataset contains:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Data Processing
The raw data is transformed using the "run_analysis.R" script, described by the following:

### 1. Merged dataset containing both the test and training datasets
### 2. Activity text replaces activity labels
  * WALKING
  * WALKING_UPSTAIRS
  * WALKING_DOWNSTAIRS
  * SITTING
  * STANDING
  * LAYING

### 3. Measurements only containing the mean or standard deviation are extracted

### 4. Final dataset "Tidy_Avg_MeasurementsBy_Subject_Activity.txt" contains the AVERAGE of all "mean" and "standard deviation" measurements for each subject/activity combination
