Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 


## Signals
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

*tBodyAcc-XYZ
*tGravityAcc-XYZ
*tBodyAccJerk-XYZ
*tBodyGyro-XYZ
*tBodyGyroJerk-XYZ
*tBodyAccMag
*tGravityAccMag
*tBodyAccJerkMag
*tBodyGyroMag
*tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

##Variables

1. `subject` - Integer
2. `activity` - Character
3. `tBodyAccMeanX` - Numeric
4. `tBodyAccMeanY` - Numeric
5. `tBodyAccMeanZ` - Numeric
6. `tGravityAccMeanX` - Numeric
7. `tGravityAccMeanY` - Numeric
8. `tGravityAccMeanZ` - Numeric
9. `tBodyAccJerkMeanX` - Numeric
10. `tBodyAccJerkMeanY` - Numeric
11. `tBodyAccJerkMeanZ` - Numeric
12. `tBodyGyroMeanX` - Numeric
13. `tBodyGyroMeanY` - Numeric
14. `tBodyGyroMeanZ` - Numeric
15. `tBodyGyroJerkMeanX` - Numeric
16. `tBodyGyroJerkMeanY` - Numeric
17. `tBodyGyroJerkMeanZ` - Numeric
18. `tBodyAccMagMean` - Numeric
19. `tGravityAccMagMean` - Numeric
20. `tBodyAccJerkMagMean` - Numeric
21. `tBodyGyroMagMean` - Numeric
22. `tBodyGyroJerkMagMean` - Numeric
23. `fBodyAccMeanX` - Numeric
24. `fBodyAccMeanY` - Numeric
25. `fBodyAccMeanZ` - Numeric
26. `fBodyAccMeanFreqX` - Numeric
27. `fBodyAccMeanFreqY` - Numeric
28. `fBodyAccMeanFreqZ` - Numeric
29. `fBodyAccJerkMeanX` - Numeric
30. `fBodyAccJerkMeanY` - Numeric
31. `fBodyAccJerkMeanZ` - Numeric
32. `fBodyAccJerkMeanFreqX` - Numeric
33. `fBodyAccJerkMeanFreqY` - Numeric
34. `fBodyAccJerkMeanFreqZ` - Numeric
35. `fBodyGyroMeanX` - Numeric
36. `fBodyGyroMeanY` - Numeric
37. `fBodyGyroMeanZ` - Numeric
38. `fBodyGyroMeanFreqX` - Numeric
39. `fBodyGyroMeanFreqY` - Numeric
40. `fBodyGyroMeanFreqZ` - Numeric
41. `fBodyAccMagMean` - Numeric
42. `fBodyAccMagMeanFreq` - Numeric
43. `fBodyBodyAccJerkMagMean` - Numeric
44. `fBodyBodyAccJerkMagMeanFreq` - Numeric
45. `fBodyBodyGyroMagMean` - Numeric
46. `fBodyBodyGyroMagMeanFreq` - Numeric
47. `fBodyBodyGyroJerkMagMean` - Numeric
48. `fBodyBodyGyroJerkMagMeanFreq` - Numeric
49. `tBodyAccStdX` - Numeric
50. `tBodyAccStdY` - Numeric
51. `tBodyAccStdZ` - Numeric
52. `tGravityAccStdX` - Numeric
53. `tGravityAccStdY` - Numeric
54. `tGravityAccStdZ` - Numeric
55. `tBodyAccJerkStdX` - Numeric
56. `tBodyAccJerkStdY` - Numeric
57. `tBodyAccJerkStdZ` - Numeric
58. `tBodyGyroStdX` - Numeric
59. `tBodyGyroStdY` - Numeric
60. `tBodyGyroStdZ` - Numeric
61. `tBodyGyroJerkStdX` - Numeric
62. `tBodyGyroJerkStdY` - Numeric
63. `tBodyGyroJerkStdZ` - Numeric
64. `tBodyAccMagStd` - Numeric
65. `tGravityAccMagStd` - Numeric
66. `tBodyAccJerkMagStd` - Numeric
67. `tBodyGyroMagStd` - Numeric
68. `tBodyGyroJerkMagStd` - Numeric
69. `fBodyAccStdX` - Numeric
70. `fBodyAccStdY` - Numeric
71. `fBodyAccStdZ` - Numeric
72. `fBodyAccJerkStdX` - Numeric
73. `fBodyAccJerkStdY` - Numeric
74. `fBodyAccJerkStdZ` - Numeric
75. `fBodyGyroStdX` - Numeric
76. `fBodyGyroStdY` - Numeric
77. `fBodyGyroStdZ` - Numeric
78. `fBodyAccMagStd` - Numeric
79. `fBodyBodyAccJerkMagStd` - Numeric
80. `fBodyBodyGyroMagStd` - Numeric
81. `fBodyBodyGyroJerkMagStd` - Numeric

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation


Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'
