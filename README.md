# Hopkins 2: Getting and Cleaning Data : Course Project #

My Script works as follows: 

1. I first read in all 6 files, renaming variable as appropriate.
2. I combine them in two stages: first the three test files and training files separately.
3. Then after adding a "provenance" variable with values of either "test" or "train" I combine again. These three steps all happen in the code block beginning on line 11.
4. To great a summary table, I group by subject and activity, and then take the mean of the measurements, changing the variable names appropriately. 
5. Finally I wrote the output as requested.

## Codebook ##

`subjId` : integer representing individual subjects.

`activity`: factor variable taking on values described in activity_labels.txt

`partitionId`: providence variable with values of 'test' or 'train'

`[mean|std][XYZ]Acc`: 6 measurement variables, representing mean and std of acceleration in the X,Y, and Z directions.

`avg[mean|std][XYZ]Acc`: in the summary table, the previous variables, averaged over groups determined by `subjId` and `activity`