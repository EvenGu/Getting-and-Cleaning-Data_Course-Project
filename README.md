
# Getting-and-Cleaning-Data_Course-Project
<p>This script uses the data collected from an experiment, where a group of 30 volunteers each performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.</p>
<h3>This script does the following:</h3>
 <ol>
   <li>Merges the training and the test sets to create one data set assigned to <em>df (dim=10299x563)</em></li>
   <li>Extracts only the measurements on the mean and standard deviation for each measurement, <em>dfMeanStd (dim=10299x88)</em>
   <li>Uses descriptive activity names to name the activities in the data set</li>
   <li>Appropriately labels the data set with descriptive variable names, <em>by replacing the abbrevations with the full  names</em></li>
   <li>Creates a second, independent tidy data set with the average of each variable for each activity and each subject  <em>dfGroup (dim=180x88)</em></li>
 </ol>

