CodeBook for DS.Getdata006
========================================================

This is the code book for the tidy data at `data/combined_tidy_dataset.txt`.
For further information on how the tidy data was created, please refer to the
README.md file. 

The data has 180 rows and 81 variables(columns). The first two columns are:

**Subject.ID:** numerical identification for persons either in test group or train group.

**Activities:** Labels for what the subject is doing at the time of data acquisition. 

**Remaiming columns of 79 variables:** their names follow the convention below:

They are all either mean (variable names containing 'mean') values or stand deviation
(variable names containing 'std') values of data that describe human body movements and effects
of gravity. These variables have names with different elements besides 'mean' and 'std'.

1. Types of data (time or frequency)
  * prefix _time_ indicates time-domain data.
  * prefix _frequency_ indicates frequency-domain data.
    
2. Sources of data (body or gravity)
 * variables with _Body_: data of the subjects' bodies.
 * variables with _Gravity_: data of the gravity.
 
3. Types of sensor (accelerometer to linear acceleration and gyroscope to measure angular velocity)
 * variables with _Acc_: data from accelerometer.
 * variables with _Gyro_: data from gyroscope. 

4. Body jerking motion
5. Magnitude
  * variables with _Mag_ indicates magnitudes of three-dimensional signals calculated using the Euclidean norm

Summary of variables
====================

Following ares are summary for 81 variables of their data type, data width. The first two are
of type factor so their first 6 levels are shown. Remaining variables are numberic and their
5-number summary are shown.

Subject.ID
-----

    Data Type: factor
    Data Width: 2
    First 6 levels:
    1	10	11	12	13	14

Activities
-----

	Data Type: factor
	Data Width: 18
	First 6 levels:
		LAYING	SITTING	STANDING	WALKING	WALKING_DOWNSTAIRS	WALKING_UPSTAIRS

time.BodyAcc.mean.X
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		3482	4938	5151	5152	5410	6187

time.BodyAcc.mean.Y
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		2659	4074	5436	5282	6463	7577

time.BodyAcc.mean.Z
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		2177	4351	5681	5259	6338	7282

time.BodyAcc.std.X
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		862.6	2354	5784	5152	6968	10070

time.BodyAcc.std.Y
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		927.7	3940	5141	5196	6265	9901

time.BodyAcc.std.Z
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		837	2644	5708	5005	6935	10120

time.GravityAcc.mean.X
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		109.5	3333	5789	5217	7068	10010

time.GravityAcc.mean.Y
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		476.4	2938	4998	5050	6958	10120

time.GravityAcc.mean.Z
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		554.7	3152	4972	5046	6771	10110

time.GravityAcc.std.X
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		1188	2918	4904	4954	7089	9186

time.GravityAcc.std.Y
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		1461	2946	5050	4932	6560	9108

time.GravityAcc.std.Z
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		1053	3291	4992	4959	6531	8913

time.BodyAccJerk.mean.X
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		2251	2838	4447	4956	7127	7549

time.BodyAccJerk.mean.Y
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		3497	4346	5037	5073	5832	6808

time.BodyAccJerk.mean.Z
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		4160	4900	5130	5152	5384	6242

time.BodyAccJerk.std.X
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		1025	2655	5746	5068	6799	10060

time.BodyAccJerk.std.Y
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		1343	2919	5544	5046	6660	9644

time.BodyAccJerk.std.Z
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		588	2229	5807	4898	7354	9155

time.BodyGyro.mean.X
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		3013	4001	5363	5272	6373	8565

time.BodyGyro.mean.Y
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		3304	4701	5168	5137	5631	6765

time.BodyGyro.mean.Z
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		2174	3716	5064	4978	6415	7873

time.BodyGyro.std.X
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		587.5	2412	5330	4913	7378	9370

time.BodyGyro.std.Y
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		448.7	2417	5792	4954	7051	10100

time.BodyGyro.std.Z
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		824	2356	5833	4949	7099	10180

time.BodyGyroJerk.mean.X
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		3625	4667	5183	5173	5692	6923

time.BodyGyroJerk.mean.Y
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		3991	4747	5048	5191	5615	6606

time.BodyGyroJerk.mean.Z
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		4018	4875	5108	5170	5478	6687

time.BodyGyroJerk.std.X
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		410.7	2412	5570	4918	7371	9362

time.BodyGyroJerk.std.Y
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		418	2453	5628	4913	7318	9889

time.BodyGyroJerk.std.Z
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		478.9	2193	5659	4908	7375	8894

time.BodyAccMag.mean
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		788.2	2965	5607	5223	6723	10000

time.BodyAccMag.std
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		986.2	2379	5682	5136	6776	9961

time.GravityAccMag.mean
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		788.2	2965	5607	5223	6723	10000

time.GravityAccMag.std
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		986.2	2379	5682	5136	6776	9961

time.BodyAccJerkMag.mean
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		1084	2471	5805	4991	7119	9870

time.BodyAccJerkMag.std
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		1150	2559	5713	5060	6807	9856

time.BodyGyroMag.mean
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		853.1	2478	5840	5017	6954	9989

time.BodyGyroMag.std
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		725.1	2610	5697	4951	7082	9912

time.BodyGyroJerkMag.mean
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		531.9	2270	5544	4895	7382	9530

time.BodyGyroJerkMag.std
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		466	2277	5659	4907	7314	9480

frequency.BodyAcc.mean.X
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		1029	2419	5824	5114	6933	10030

frequency.BodyAcc.mean.Y
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		1047	4034	5326	5165	6317	9812

frequency.BodyAcc.mean.Z
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		849.4	2409	5723	4956	7266	9886

frequency.BodyAcc.std.X
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		812.3	2507	5761	5160	6933	10070

frequency.BodyAcc.std.Y
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		874	3725	5388	5164	6415	9874

frequency.BodyAcc.std.Z
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		926.2	2614	5655	4999	6895	10160

frequency.BodyAcc.meanFreq.X
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		2335	4043	4955	5085	6120	8271

frequency.BodyAcc.meanFreq.Y
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		2303	3940	5088	5098	6029	8706

frequency.BodyAcc.meanFreq.Z
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		1866	3956	5352	5118	6318	8401

frequency.BodyAccJerk.mean.X
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		1133	2560	5759	5034	6945	9886

frequency.BodyAccJerk.mean.Y
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		1168	2703	5611	5025	6855	9507

frequency.BodyAccJerk.mean.Z
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		619.1	2331	5753	4909	7368	9103

frequency.BodyAccJerk.std.X
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		1022	2753	5802	5034	6941	10090

frequency.BodyAccJerk.std.Y
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		1225	2856	5509	5030	6636	9640

frequency.BodyAccJerk.std.Z
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		601.8	2261	5776	4891	7397	9105

frequency.BodyAccJerk.meanFreq.X
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		1795	2911	4464	4968	7067	8262

frequency.BodyAccJerk.meanFreq.Y
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		2406	4023	4885	5054	6046	8611

frequency.BodyAccJerk.meanFreq.Z
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		2301	3578	5032	5020	6308	8339

frequency.BodyGyro.mean.X
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		855.4	2512	5360	4954	7161	10190

frequency.BodyGyro.mean.Y
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		628.5	2537	5700	4943	7195	9656

frequency.BodyGyro.mean.Z
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		1004	2492	5825	4980	7007	10120

frequency.BodyGyro.std.X
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		761.6	2411	5340	4911	7401	9391

frequency.BodyGyro.std.Y
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		517.2	2348	5719	4955	7003	10190

frequency.BodyGyro.std.Z
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		612	2386	5928	4923	7143	10050

frequency.BodyGyro.meanFreq.X
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		2942	4186	4745	5078	6034	8088

frequency.BodyGyro.meanFreq.Y
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		3076	4404	4977	5164	5682	8928

frequency.BodyGyro.meanFreq.Z
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		2221	4056	4984	5090	5981	8596

frequency.BodyAccMag.mean
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		1176	2515	5544	5155	6749	9991

frequency.BodyAccMag.std
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		769.3	2376	6053	4996	7103	10010

frequency.BodyAccMag.meanFreq
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		1460	4251	5406	5142	6216	8000

frequency.BodyBodyAccJerkMag.mean
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		1126	2512	5752	5076	6762	9989

frequency.BodyBodyAccJerkMag.std
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		892.5	2700	5773	5041	6864	9240

frequency.BodyBodyAccJerkMag.meanFreq
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		1753	4177	5131	5056	6114	7882

frequency.BodyBodyGyroMag.mean
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		983.6	2496	5829	4923	7210	9001

frequency.BodyBodyGyroMag.std
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		662.6	2460	5568	4922	7208	9932

frequency.BodyBodyGyroMag.meanFreq
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		2637	4088	4864	5187	6216	8808

frequency.BodyBodyGyroJerkMag.mean
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		478.3	2276	5633	4902	7377	9503

frequency.BodyBodyGyroJerkMag.std
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		611	2274	5610	4905	7318	9493

frequency.BodyBodyGyroJerkMag.meanFreq
-----

	Data Type: numeric
	Data Width: 16
	Summary:
		Min.	1st Qu.	Median	Mean	3rd Qu.	Max.
		2681	4424	5133	5137	5938	7729