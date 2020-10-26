/*Emily Bressan Assigment 2*/
/*I certify that the SAS code given is my original and exclusive work*/

/*1a- Read the entire data using the list style of input. Make sure to the read the full-length and
complete data values including cases where there are multiple words for a variable value.
Print the entire data set.*/
/*1b- Create a user-defined format (using Proc Format) such that the brand letter is associated
with the manufacturer. Here are the manufacturers of the brands: A = Positive Battery, B =
Panasonic, C = F.W. Webb, and D = Samsung. Apply your created formatting when printing
the entire data set such that the manufacture name is displayed*/
ods text= '1a and 1b';
proc format; /*proc format makes it so there are pre assigned label to vairables before the data is given*/
value $brand
'A'  = "Positive Battery"
'B'  = "Panasonic"
'C'  = "F.W. Webb"
'D'  = "Samsung"
;
run;
Data batfail;
length Condition $9;
input Condition & $  Brand $  Age  WiFi $ TimetoFail; /* & makes it so it reads two words for a variable*/
format Brand $brand.;
datalines;
Room Temp  A  7  On  181
Room Temp  B  1  On  187
Room Temp  C  3  On  150
Room Temp  D  0  On  173
Cold  A  4  On  85
Cold  B  0  On  80
Cold  C  2  On  93
Cold  D  8  On  87
Room Temp  A  7  Off  180
Room Temp  B  5  Off  192
Room Temp  C  4  Off  159
Room Temp  D  0  Off  190
Cold  A  3  Off  85
Cold  B  3  Off  87
Cold  C  1  Off  100
Cold  D  8  Off  98
;
run;
proc print data= batfail;
run;


/*1c- Create a second data step that modifies the original data set such that the new data set has
only “Cold” conditions and time-to-fail less than 90. Print the resulting data set using the
formatting applied in (b).*/
ods text= '1c';
proc format;
value $brand
'A'  = "Positive Battery"
'B'  = "Panasonic"
'C'  = "F.W. Webb"
'D'  = "Samsung"
;
value timef
91-192 = ' '
low-90 = '<90'
; 
value $cond
'Room Temp' = ' '
'Cold' = "Cold" 
;

Data batfail;
length Condition $9;
input Condition & $  Brand $  Age  WiFi $ TimetoFail; 
format timetofail timef. Condition $cond. brand $brand.;
datalines;
Room Temp  A  7  On  181
Room Temp  B  1  On  187
Room Temp  C  3  On  150
Room Temp  D  0  On  173
Cold  A  4  On  85
Cold  B  0  On  80
Cold  C  2  On  93
Cold  D  8  On  87
Room Temp  A  7  Off  180
Room Temp  B  5  Off  192
Room Temp  C  4  Off  159
Room Temp  D  0  Off  190
Cold  A  3  Off  85
Cold  B  3  Off  87
Cold  C  1  Off  100
Cold  D  8  Off  98
;
run;


/*1d- Create a third data step that modifies the original data set such that the new data set has
only observations 7 through 10 and the variables Brand, Age, and WiFi are removed. Print
the entire resulting data set.*/
ods text= '1d';
proc format; /*proc format makes it so there are pre assigned label to vairables before the data is given*/
value $brand
'A'  = "Positive Battery"
'B'  = "Panasonic"
'C'  = "F.W. Webb"
'D'  = "Samsung"
;
run;
Data batfail;
length Condition $9;
input Condition & $  Brand $  Age  WiFi $ TimetoFail; 
format Brand $brand.;
datalines;
Room Temp  A  7  On  181
Room Temp  B  1  On  187
Room Temp  C  3  On  150
Room Temp  D  0  On  173
Cold  A  4  On  85
Cold  B  0  On  80
Cold  C  2  On  93
Cold  D  8  On  87
Room Temp  A  7  Off  180
Room Temp  B  5  Off  192
Room Temp  C  4  Off  159
Room Temp  D  0  Off  190
Cold  A  3  Off  85
Cold  B  3  Off  87
Cold  C  1  Off  100
Cold  D  8  Off  98
;
run;
proc print data= batfail (firstobs= 7 obs = 10);
var Condition TimetoFail; 
run;

/*The text file Schools1.txt has five variables (listed in the order given): School_ID, Magnet, Grade,
Students, and Score. You may copy and paste the values from the text file into data lines in your
SAS program. Read the data into a SAS data set in whichever style is most convenient.*/
/*2a- In the same data step used to read the data create a new variable called Size which is a
character-based variable that takes on a value “Small” if the number of students is less than
60; “Medium” if the number of students is between 60 and 99, inclusive; and “Large” if 100
or more. Make sure you use efficient code. Print the entire data set which includes your
new variable.*/
ods text= '2a';
data schools;
input School_ID 1-4  Magnet $ 9-11 Grade $ 16 Students 21-23 Score 28-30 Size $ 33-38  ;
if Students < 60 then Size = 'Small';
Else If 60 <= Students <= 99 then Size = 'Medium';
Else Size ='Large';
datalines;
1202    yes    D     42    299
1454    no     A     41    299
1613    no     C    125    295
1812    no     C     83    289
1838    yes    A    123    326
1963    yes    A     81    311
2081    yes    A    170    303
2388    no     B     90    304
2393    no     A    113    295
2543    no     C     59    294
2547    no     B     30    294
2564    yes    C     50    290
2659    no     A     15    306
2714    no     B    123    297
2942    yes    A     90    312
3125    yes    C     92    292
3208    no     A     45    293
3324    no     C     66    296
3377    no     A     53    296
3664    no     D    109    295
;
run;
proc print data= schools;
; 
run;

/*2b-Sort your data by the variable Grade such that the original order is retained in the original
data set and the sorted data is output to a different, new data set. Print the first 8
observations for all variables of the sorted data set.*/
ods text= '2b';
data schools1;
input School_ID 1-4  Magnet $ 9-11 Grade $ 16 Students 21-23 Score 28-30 Size $ 33-38  ;
if Students < 60 then Size = 'Small';
Else If 60 <= Students <= 99 then Size = 'Medium';
Else Size ='Large';
datalines;
1202    yes    D     42    299
1454    no     A     41    299
1613    no     C    125    295
1812    no     C     83    289
1838    yes    A    123    326
1963    yes    A     81    311
2081    yes    A    170    303
2388    no     B     90    304
2393    no     A    113    295
2543    no     C     59    294
2547    no     B     30    294
2564    yes    C     50    290
2659    no     A     15    306
2714    no     B    123    297
2942    yes    A     90    312
3125    yes    C     92    292
3208    no     A     45    293
3324    no     C     66    296
3377    no     A     53    296
3664    no     D    109    295
;
run;
proc sort;
by descending Grade; /*this sorts the variables by grade*/
proc print data= schools1 (obs = 8);
; 
run;


/*2c-Another text file Schools2.txt has three variables. The first variable is the identical to the
School_ID variable from the Schools1 data set. The second variable, spending per student
(Expenditures), and the third variable, percent gifted students (Gifted), have non-standard
numeric data values. Use the list style of input to read all variables such that they are stored
as stand numeric values. Print the entire data set to confirm all variables are numeric.*/
ods text= '2c';
data Schools2;
input School_ID Expenditures dollar7.  Gifted percent7.1 ;
datalines;
1202    $8,106    11.6%
1454    $7,969    6.7%
1613    $8,302    8.0%
1812    $7,235    4.5%
1838    $10,765    6.2%
1963    $7,064    4.6%
2081    $7,034    9.4%
2388    $9,681    1.3%
2393    $6,304    10.6%
2543    $11,545    11.4%
2547    $5,746    11.1%
2564    $5,307    2.2%
2659    $8,946    8.7%
2714    $11,603    3.7%
2942    $8,042    3.3%
3125    $11,359    7.2%
3208    $5,659    3.6%
3324    $7,175    4.3%
3377    $8,605    5.0%
3664    $9,361    6.2%
;
run;

proc print data = schools2;
run;


/*.2d- Using the resulting data sets from (a) and (c), merge them by the variable School_ID. Print
the entire resulting data set but re-format the values of the variables Expenditures and
Gifted as they were originally formatted.*/
ods text= '2d';
data mergesc;
merge schools schools2;
by School_ID;
run;

proc print data= mergesc;
format Expenditures dollar7. 
Gifted percent7.1 ;
run;

/*3. Refer to the file called diamond.csv and complete the following tasks:*/
/*3a-Import the file into SAS so that it can be used as a SAS data set. Print the 381st to 409th
observation in the data set.*/
ods text= '3a';
FILENAME CSV '/home/u49613901/Homework/diamond.csv';

proc import  datafile= CSV out= Diamond dbms= CSV;
proc print data= Diamond (firstobs=381 obs=409);
var carat color price;
run;

/*3b-Using the data set produced in (a), modify your Proc Print to print just the carat, color,
and price values for only diamonds considered to be one-half carat (actual carat weight
between 0.48 and 0.52 carat inclusive) and having a color rating of D. */
ods text= '3b';
proc import  datafile= CSV out= Diamond dbms= CSV;
proc print data= Diamond;
var carat color price;
where 0.48<=carat<= 0.52;
where also color = 'D';
run;
/*3c-Using two new separate data steps, create one data set that consists just of
Observations 47 through 60 and another data set that consists just of Observations 825
through 842. Print the first 5 observations from each of the two new data sets*/
ods text= '3c';
proc import  datafile= CSV out= Diamond dbms= CSV;
run;
data Diamond_1;
set Diamond (firstobs=47 obs=60);
data Diamond_2;
set Diamond (firstobs=825 obs=842);
run;
proc print data= diamond_1 (obs=5);
proc print data= diamond_2 (obs=5);
run;
/*3d- Using the two data sets created in (c), concatenate them into one data set while
renaming the variable clarity to Rating from both data sets. Print the concatenated data
set. */
ods text= '3d';
data Diconc;
set Diamond_1 (rename= (clarity=Rating)) Diamond_2 (rename= (clarity=Rating));
run;
proc print data= diconc;
run;





