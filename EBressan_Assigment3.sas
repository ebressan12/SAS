/*Emily Bressan Assigment 3*/
/*I certify that the SAS code given is my original and exclusive work*/
/* 1.Create data sets from the raw data in each of the files,AirFleet.txtand ALCodes.txt 
(variable names in first row), using appropriate SAS data steps. 
a.Print both data sets completely.*/

Data AirFleet  ;
length Code $ 2 Aircraft $ 10 Mgf $ 17; /*This helps the entire name appear*/
Input Code $
      Aircraft $
      Mgf & $ 
      Inservice
      AvgAge
      ;
Datalines;
DL    B717-200    Boeing     91    15.1
DL    B737-700    Boeing     10    7.7
DL    B737-800    Boeing     73    15.7
DL    B737-900ER    Boeing     65    1.7
DL    B747-400    Boeing     9    24.5
DL    B757-200    Boeing     103    19.3
DL    B757-300    Boeing     16    13.6
DL    B767-300    Boeing     10    24.7
DL    B767-300ER    Boeing     58    20.5
DL    B767-400ER    Boeing     21    15.6
DL    B777-200ER    Boeing     8    16.7
DL    B777-200LR    Boeing     10    7.5
DL    A319-100    Airbus     57    14.7
DL    A320-200    Airbus     69    21.6
DL    A321-200    Airbus     11    0.2
DL    A330-200    Airbus     11    11.5
DL    A330-300    Airbus     29    8.3
DL    MD-88    McDonnell Douglas     116    26.2   
DL    MD-90    McDonnell Douglas     65    19.6    
B6    A320-200    Airbus     130    11.3
B6    A321-200    Airbus     11    1.6
B6    E190    Embraer    100    8.1
AA    A319-100    Airbus     125    12.7
AA    A320-200    Airbus     50    15.4
AA    A321-200    Airbus     202    4.9
AA    A330-200    Airbus     15    9.2
AA    A330-300    Airbus     9    9.2
AA    737-800    Boeing     286    7.7
AA    757-200    Boeing     51    18
AA    767-300ER    Boeing     31    20.6
AA    777-200ER    Boeing     47    12
AA    777-300ER    Boeing     20    12
AA    787-8    Boeing     17    1.6
AA    787-9    Boeing     6    0.8
AA    E190    Embraer     20    9
AA    MD-82    McDonnell Douglas     17    21.1
AA    MD-83    McDonnell Douglas     40    22.8
WN    B737-300    Boeing     111    22.4
WN    B737-500    Boeing     8    18.1
WN    B737-700    Boeing     484    10.1
WN    B737-800    Boeing     111    9.8
SQ    A330    Airbus     26    4.6
SQ    A350    Airbus     6    0.5
SQ    A380    Airbus     19    7.4
SQ    747    Boeing     9    14.4
SQ    777    Boeing     53    10.5
;
run;
proc print data= AirFleet;
run;

Data ALCodes;
length Code $ 2 Airline $ 18; /*This helps the entire names appear*/
Input Code $
     Airline & $ 
;
datalines;
AS    Alaska Airlines
AA    American Airlines
BA    British Airways 
DL    Delta Airlines
HA    Hawaiian Airlines
QX    Horizon Air
FI    Icelandair
B6    JetBlue
FR    Ryanair 
SQ    Singapore Airlines
WN    Southwest Airlines
NK    Spirit Airlines

;
run;
proc print data= ALCodes;
run;

/* b.Using PROC SQL perform an inner join between the two data sets using the Codevariable  
as the common identifier.  The result should be placed in a data set called Airline_Fleets_1 
and should be printed in its entirety. */

Data AirFleet;
set work.airfleet; /*added work to indicate that im using thses in the next step*/
run;

Data AlCodes;
set work.alcodes;
run;

PROC SQL;
CREATE TABLE Airline_Fleets_1 AS
SELECT * from Airfleet
inner join AlCodes
on AirFleet.code = AlCodes.code 
;
run;
proc print data= Airline_Fleets_1;
run;
/* c.Using PROC SQL perform a left join between the two data sets. 
Assume the AirFleet data is the first data table and the ALCodes data is the second table. 
The result should be placed in a data set called Airline_Fleets_2 and should be printed in its entirety. */


PROC SQL;
CREATE TABLE Airline_Fleets_2 AS
SELECT * from Airfleet
left join AlCodes
on AirFleet.code = AlCodes.code 
;
run;
proc print data= Airline_Fleets_2;
run;

/*d.Include a brief description using an ods text=’’; statement comparing the two results
of Airline_Fleets_1 and Airline_Fleets_2 and an explanation as to why they appear the way that they do. */

ods text= 'The fisrt table does not have an specific order but the second one is organized
by Alphabetical order';

/*2.Referring to the data sets in Problem 1, complete the following:a.Using only the data 
set created from AirFleet.txt above in Problem 1, use PROC SQL to produce a table that counts
 the number of planes in service for each manufacturer (Boeing, Airbus, etc.). */
PROC SQL;
CREATE TABLE number_of_planes as
SELECT Mgf, 
sum (Inservice) as Number  
from AirFleet
GROUP BY Mgf ;
RUN;
proc print data = number_of_planes;
run;

/*b.Using the joined table, Airline_Fleets_1, from 1(b) above, use PROC SQL to produce
a table that displays the average of the AvgAge variable for each airline.  
The table should have the airlines in alphabetical order. */

PROC SQL;
CREATE TABLE AvgAgePlane as
SELECT Airline,
avg(AvgAge) as FleetAvgAge
from Airline_Fleets_1
group by Airline;
RUN;
proc print data = AvgAgePlane;
run;

/*3.A manufacturer of medical devices needs to replace a power supply on one of its
machines periodically due to wear out.  It can be assumed that the life of a power 
supply follows a normal distribution with a mean of 200 days and a standard deviation
of 36 days.  Three different brands of power supplies were monitored with the installation
and replacement dates recorded.  Due to the different logs being used to record information,
the installation and replacement dates had different formats.  Variable names and data are in 
the file Power.txt and are similar to the following:*/

/*You may copy and paste the data into data lines of a SAS data step.
a.Using the list style of input read in the above data such that the dates are stored as numbers (SAS dates).
  Print the resulting data set without formatting it.*/
 
Data PowerSup;
Input Brand $ Install :date9. Replace :mmddyy8. 
       ;
Datalines;
Zap   13MAR2019 12/20/19
Jolt  19FEB2020 9/29/20
Shock 25MAR2020 8/2/20
;
RUN;
proc print data = PowerSup;
/* format Install :date9. */
/*        Replace :mmddyy8. ; */ /*if i wanted to make it pretty i could add these two lines*/
run;
 
/*b.Create a new data step based on the one in 3(a) that calculates how long each power supply lasted in days. 
The resulting days lasted should be placed in a new variable.  Print the entire data set.*/

Data PowerSup;
Input Brand $ Install :date9. Replace :mmddyy8. ;
      DaysLasted= Replace-Install;
Datalines;
Zap   13MAR2019 12/20/19
Jolt  19FEB2020 9/29/20
Shock 25MAR2020 8/2/20
;
RUN;
proc print data = PowerSup;
run;


/*c.Again, create a new data step based on the one in 3(b). 
 Use the cdf function to calculate anew variable which gives the probability that a random 
 power supply will last longer than each brand did. Base this calculation on the distribution assumptions given above.
 Print the result just showing the Brand and Probability variables.*/

data PowerLast;
Mu= 200; Sigma= 36;
input Brand $ Install :date9. Replace :mmddyy8.
;
 DaysLasted = Replace - Install ;
p=cdf('normal',DaysLasted,Mu,Sigma);
Datalines;
Zap   13MAR2019 12/20/19
Jolt  19FEB2020 9/29/20
Shock 25MAR2020 8/2/20
;
run;
proc print data = PowerLast;
run;

 /*d.Based on your probability calculations which brand seems to be best and why? 
 Place your responses in an ods text=’’; statement.*/

ods text='Zap seems to be the best because it lasts
the longest between the install date and the replacement date';

/*4.The raw data in the file Frisbee.txthas two variables:
 (1) Grip used to throw the Frisbee disk(finger out,  normal,  inverted) and
 (2) Distance of the disk’s flight.
 There is more than one observation per data line in the text file.*/
/*a.Paste the data as it appears in the text file into SAS data lines and create
 a data step that successfully reads all observations.  
Print the first 10 observations.*/
Data Frisbee;
Length Grip $11;
Input Grip $ & Distance @@;
Datalines;
Finger Out    33   Finger Out    32   Finger Out    23
Finger Out    36   Finger Out    26   Finger Out    27
Finger Out    30   Finger Out    29   Normal    39
Normal    34   Normal    36   Normal    37
Normal    30   Normal    28   Normal    30
Normal    31   Inverted    33   Inverted    34
Inverted    36   Inverted    37   Inverted    30
Inverted    28   Inverted    30   Inverted    31
;
run;
Proc print data = frisbee (obs=10);
run;

/*b.Create side-by-side box plots to compare the grips.  Create a custom title for your output
 that gives a general description of the display.*/

Proc Sort Data =frisbee;
By Grip;
run;
Title 'Side by Side Comparison of Throw by Grip';
proc boxplot data= frisbee;
plot Distance*Grip / Boxstyle=schematic;
run;
/*this is someting that you can use after you have already added your variables*/

/*c.Based on the above comparison, which grip would you use to get the longest flight?
Explain in the context of your interpretation of the distribution of distances for each grip.
 (Place your response and explanation in an ods text=’’; statement.)*/

ods text='3c.Between the 3 Grips Finger Out has the longest range of Distance, Inverterd Grip has the smallest
and Normal Grip falls right in the middle';

/*d.Is there a grip that produces more consistency (less variation)?  
Explain.  (Place your response and explanation in an ods text=’’; statement.)*/

ods text='3d.Finger out has the most consistency because the mean and median are the same, In the other two
 plots they are not';
 
 

