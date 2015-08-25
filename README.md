
# Getting-and-Cleaning-Data_Course-Project
<p>This script uses the data collected from an experiment, where a group of 30 volunteers each performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.</p>
<h3>This script does the following:</h3>
 <ol>
   <li>Merges the training and the test sets to create one data set <em><strong>assigned to df (dim=10299x563)</strong></em></li>
   <li>Extracts only the measurements on the mean and standard deviation for each measurement, <em><strong>dfMeanStd (dim=10299x88)</strong></em>
   <li>Uses descriptive activity names to name the activities in the data set</li>
   <li>Appropriately labels the data set with descriptive variable names, <em><strong>by replacing the abbrevations with the full names</strong></em></li>
   <li>Creates a second, independent tidy data set with the average of each variable for each activity and each subject  <em><strong>dfGroup (dim=180x88)</strong></em></li>
 </ol>
<p><strong>Note: </strong>to run the run_analysis.R, please place the script in the working directory that contains the "UCI HAR Dataset" folder (outside the "UCI HAR Dataset" folder). </p>

