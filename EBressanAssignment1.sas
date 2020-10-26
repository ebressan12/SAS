/*Emily Bressan Assigment 1*/
/*I certify that the SAS code given is my original and exclusive work*/

Data Textbooks;  
/*1a*/
Input Department $ 1-4 
      Course     $ 5-8
      ISBN       $ 9-22
      Bookstore    23-28
      Amazon       29-34
      Required   $ 35;
Datalines; 
Engl151C978-0199561339 25.95 18.94Y
Engl180A978-0374515362 18.00 12.24Y
Anth135T978-0300080643 31.68 32.00Y
Anth191H978-0226206813 16.00 11.52Y
Comp 20A978-0470509487126.67 97.38N
Mgmt127B978-0324828641214.50173.56N
Phys  6A978-0534491437188.00159.28Y
Psyc134A978-0073378541 85.12 67.40Y
Russ 90B978-0674304437 29.70 24.31Y
Stat200C978-0412043710 92.10 80.37N
Urbn275M978-1592134328 42.00 37.04Y
Wrld409A978-0195390827 39.55 26.37N
Womn285C978-0822341147 27.70 18.22Y
;
run;
/*1*/
proc print data= Textbooks (firstobs= 8 obs = 11) noobs;
var ISBN Bookstore;
run;


/*1b*/
Data Textbooks1;  
Input @1 Department $ 1-4
      @2 Course     $ 5-8
      @3 Required   $ 35
      @4 Amazon     $ 29-34
      @5 ISBN       $ 9-22;
Datalines; 
Engl151C978-0199561339 25.95 18.94Y
Engl180A978-0374515362 18.00 12.24Y
Anth135T978-0300080643 31.68 32.00Y
Anth191H978-0226206813 16.00 11.52Y
Comp 20A978-0470509487126.67 97.38N
Mgmt127B978-0324828641214.50173.56N
Phys  6A978-0534491437188.00159.28Y
Psyc134A978-0073378541 85.12 67.40Y
Russ 90B978-0674304437 29.70 24.31Y
Stat200C978-0412043710 92.10 80.37N
Urbn275M978-1592134328 42.00 37.04Y
Wrld409A978-0195390827 39.55 26.37N
Womn285C978-0822341147 27.70 18.22Y
;
run;
proc print data= Textbooks1 label;
/*1c*/
var ISBN Amazon Required ;
label 
      Required = 'Required for the course?'
      Amazon   = 'Price on Amazon';
run;


/*2*/
/*2a*/
Data EduTrends;  
infile datalines delimiter = '*'; 
Input Year Enroll Unemp HSgrad Income;
Datalines;
1961*5501*8.1*9552*1923
1962*5945*7*9680*1961
1963*6629*7.3*9731*1979
1964*7556*7.5*11666*2030
1965*8716*7*14675*2112
1966*9369*6.4*15265*2192
1967*9920*6.5*15484*2235
1968*10167*6.4*15723*2351
1969*11084*6.3*16501*2411
1970*12504*7.7*16890*2475
1971*13746*8.2*17203*2524
1972*13656*7.5*17707*2674
1973*13850*7.4*18108*2833
1974*14145*8.2*18266*2863
1975**10.1*19308*2839
1976*14991*9.2*18224*2898
1977*14836*7.7*18997*3123
1978*14478*5.7*19505*3195
1979*14539**19800*3239
1980*14395*7.5*19546*3129
1981*14599*7.3*19117*3100
1982*14969*9.2*18774*3008
1983*15107*10.1*17813*2983
1984*14831*7.5*17304*3069
1985*15081*8.8*16756*3151
1986*15127*9.1*16749*3127
1987*15856*8.8*16925*3179
1988*15938*7.8*17231*3207
1989*16081*7*16816*3345
;
proc print data = edutrends;
run;
/*2b*/
Data EduTrends;  
infile datalines delimiter = '*';
infile datalines missover;
Input Year Enroll Unemp HSgrad Income;
datalines;
1961*5501*8.1*9552*1923
1962*5945*7*9680*1961
1963*6629*7.3*9731*1979
1964*7556*7.5*11666*2030
1965*8716*7*14675*2112
1966*9369*6.4*15265*2192
1967*9920*6.5*15484*2235
1968*10167*6.4*15723*2351
1969*11084*6.3*16501*2411
1970*12504*7.7*16890*2475
1971*13746*8.2*17203*2524
1972*13656*7.5*17707*2674
1973*13850*7.4*18108*2833
1974*14145*8.2*18266*2863
1975**10.1*19308*2839
1976*14991*9.2*18224*2898
1977*14836*7.7*18997*3123
1978*14478*5.7*19505*3195
1979*14539**19800*3239
1980*14395*7.5*19546*3129
1981*14599*7.3*19117*3100
1982*14969*9.2*18774*3008
1983*15107*10.1*17813*2983
1984*14831*7.5*17304*3069
1985*15081*8.8*16756*3151
1986*15127*9.1*16749*3127
1987*15856*8.8*16925*3179
1988*15938*7.8*17231*3207
1989*16081*7*16816*3345
;
proc print data = edutrends;
run;


/*2c*/
Data EduTrends;  
infile datalines delimiter = '*';
infile datalines dsd;
Input Year Enroll Unemp HSgrad Income;
datalines;
1961*5501*8.1*9552*1923
1962*5945*7*9680*1961
1963*6629*7.3*9731*1979
1964*7556*7.5*11666*2030
1965*8716*7*14675*2112
1966*9369*6.4*15265*2192
1967*9920*6.5*15484*2235
1968*10167*6.4*15723*2351
1969*11084*6.3*16501*2411
1970*12504*7.7*16890*2475
1971*13746*8.2*17203*2524
1972*13656*7.5*17707*2674
1973*13850*7.4*18108*2833
1974*14145*8.2*18266*2863
1975**10.1*19308*2839
1976*14991*9.2*18224*2898
1977*14836*7.7*18997*3123
1978*14478*5.7*19505*3195
1979*14539**19800*3239
1980*14395*7.5*19546*3129
1981*14599*7.3*19117*3100
1982*14969*9.2*18774*3008
1983*15107*10.1*17813*2983
1984*14831*7.5*17304*3069
1985*15081*8.8*16756*3151
1986*15127*9.1*16749*3127
1987*15856*8.8*16925*3179
1988*15938*7.8*17231*3207
1989*16081*7*16816*3345
;
proc print data = edutrends;
run;
ods text= '2d.In the file given there are spaces between ** left blank on purpose, in part "a" when I 
viewed the results there are no blank spaces instead there are spaces filled with incorrect information.
In part "b" in the lines where there are blank spaces the data moves over to the left in a new space,
even though they do not belong there. Part "c" is the correct was to display the information because 
adding the dsd option the blank spaces are respected.';



/*2e*/
Data EduTrends ;   
infile datalines delimiter = '*';
infile datalines dsd;
Input Year Enroll Unemp HSgrad Income;
datalines;
1961*5501*8.1*9552*1923
1962*5945*7*9680*1961
1963*6629*7.3*9731*1979
1964*7556*7.5*11666*2030
1965*8716*7*14675*2112
1966*9369*6.4*15265*2192
1967*9920*6.5*15484*2235
1968*10167*6.4*15723*2351
1969*11084*6.3*16501*2411
1970*12504*7.7*16890*2475
1971*13746*8.2*17203*2524
1972*13656*7.5*17707*2674
1973*13850*7.4*18108*2833
1974*14145*8.2*18266*2863
1975**10.1*19308*2839
1976*14991*9.2*18224*2898
1977*14836*7.7*18997*3123
1978*14478*5.7*19505*3195
1979*14539**19800*3239
1980*14395*7.5*19546*3129
1981*14599*7.3*19117*3100
1982*14969*9.2*18774*3008
1983*15107*10.1*17813*2983
1984*14831*7.5*17304*3069
1985*15081*8.8*16756*3151
1986*15127*9.1*16749*3127
1987*15856*8.8*16925*3179
1988*15938*7.8*17231*3207
1989*16081*7*16816*3345
;
proc print data = edutrends (obs=4) label;
var Enroll Unemp HSgrad ;
label 
      Enroll = 'Enrollment'
      Unemp = 'Unemployment Rate'
      Hsgrad= 'Number of High School Graduates';
run;


/*3a*/
Data CityCosts ;   
length City $ 18
       Country $ 11;
Input City  $ Country  $ CostLiving Rent Groceries Restaurant PurchasePower;
datalines;
Zurich     Switzerland    141.25    66.14    149.86    135.76    142.7
Geneva     Switzerland    134.83    71.7    138.98    129.74    130.96
Basel     Switzerland    130.68    49.68    127.54    127.22    139.01
Bern     Switzerland    128.03    43.57    132.7    119.48    112.71
Reykjavik     Iceland    123.78    57.25    118.15    133.19    88.95
Stavanger     Norway    118.61    39.83    106.09    143.54    118.14
Lugano     Switzerland    118.24    52.91    117.74    122.3    119.86
Oslo     Norway    117.23    49.28    112.42    124.09    102.94
Trondheim     Norway    114.22    42.39    103.5    134.76    108.29
Bergen     Norway    112.31    40.3    101.79    119.61    99.29
Kyoto     Japan    100.33    24.58    118.44    54.59    77.92
NewYork    US    100    100    100    100    100
Anchorage    US    94.99    40.12    101.18    84.55    124.92
Honolulu    US    94.15    62.82    104.69    82.86    103.08
Tokyo     Japan    93.81    37.07    99.67    58.93    106.42
Brooklyn    US    93.79    76.24    92.73    100.58    87.04
Paris     France    92.87    50.3    87.29    91.77    97.62
Rockville    US    92.66    64    87.76    74.74    130.79
Montpellier     France    90.63    24.95    86.93    75.13    74.25
London    UK    88.69    76.67    67.36    96.36    92.61
Grenoble     France    87.73    25.07    88.71    79.04    115.7
Boston     US    87.05    78.72    88.99    86.2    101.35
Nice     France    86.69    31.64    78.82    98.75    107.04
Perth     Australia    86.24    40.5    80.79    90.63    130.38
Adelaide     Australia    86.02    36.56    82.05    81.67    113.86
Miami     US    86.01    63.2    87.37    95.81    97.81
Bath    UK    85.79    37.62    78.47    83.51    117.98
Reading    UK    85.56    40.91    71.32    95.36    130.18
Melbourne     Australia    85.15    44.81    82.11    77.29    127.15
Darwin     Australia    84.98    46.52    82.29    91.79    118.09
Cairns     Australia    84.98    30.59    84.5    74.96    118.05
Lyon     France    84.47    28.04    77.74    79.13    101.17
Irvine    US    83.73    66.26    89.49    76.5    139.48
Philadelphia    US    83.46    48.09    82.24    79.37    116.06
Cambridge    UK    82.96    47.33    67.22    95.67    105.39
Toulouse     France    82.85    24.97    77.86    82.38    113.77
Brisbane     Australia    82.17    43.31    75.42    81.39    130.41
Oxford    UK    79.37    53.29    62.18    81.92    86.68
Osaka     Japan    78.5    23.88    79.2    45.06    109.62
Liverpool    UK    69.53    24.96    52.24    78.55    116.18
Brasilia     Brazil    53.84    16.73    44.65    47.74    49.33
Recife     Brazil    52.22    12.23    41.22    41.58    39.68
Ankara     Turkey    41.21    7.95    36.71    31.39    56.89
Izmir     Turkey    40.97    8.86    37.48    29.22    54.57
Bursa     Turkey    40.26    6.73    34.46    27.63    55.63
Gurgaon     India    34.9    10.96    32.59    30.88    110.97
Guadalajara     Mexico    34.19    10.12    33.15    30.82    71.87
Tijuana     Mexico    34.13    10.81    32.67    32.65    45.26
Hermosillo     Mexico    33.86    7.29    30.3    29.75    77.33
Queretaro     Mexico    33.51    9.52    33.17    27.96    63.18
Merida     Mexico    33.18    7.58    32.01    26.75    37.23
Puebla     Mexico    32.65    7.22    28.36    27.84    45.28
Mumbai     India    32.59    22.72    32.94    26.68    73.49
Noida     India    32.37    6.56    33.12    24.04    95.95
Delhi     India    32.14    9.74    30.67    27.54    78.33
Islamabad     Pakistan    30.83    8.79    28.5    23.5    43.2
Bangalore     India    30.34    9.76    31.47    20.23    100.26
Thane     India    29.82    9.3    31.07    21.18    70.55
Lahore     Pakistan    29.53    6.67    26.83    26.39    51.44
Chandigarh     India    29.04    6.47    29.4    20.18    68.83
Ahmedabad     India    28.67    6.24    31.42    20.13    73.59
Jaipur     India    27.11    5.19    27.65    18.48    76.5
Karachi     Pakistan    27.1    7.46    25.6    21.62    39.06
Hyderabad     India    26.92    6.89    27.6    18.93    80.9
Cairo     Egypt    26.49    5.43    23.23    22.55    25.27
Dnipropetrovsk     Ukraine    26.39    6.63    20.46    22.74    31.06
Nagpur     India    26.23    4.96    26.55    18.73    95.19
Mangalore     India    25.46    5.7    26.85    16.04    94.53
Lviv     Ukraine    25.31    8.1    20.5    17.88    26.88
Mysore     India    25.2    4.01    29.39    13.31    42.49
Kharkiv     Ukraine    24.85    8.29    19.26    18.44    27.19
Thiruvananthapuram     India    20.86    5.1    21.98    12.06    66.25
;
run;
proc print data = citycosts (obs=15);
run;

/*3b*/
Data CityCosts ;   
length City  $ 18
       Country $ 11;
Input City  $ Country  $ CostLiving Rent Groceries Restaurant PurchasePower;
datalines;
Zurich     Switzerland    141.25    66.14    149.86    135.76    142.7
Geneva     Switzerland    134.83    71.7    138.98    129.74    130.96
Basel     Switzerland    130.68    49.68    127.54    127.22    139.01
Bern     Switzerland    128.03    43.57    132.7    119.48    112.71
Reykjavik     Iceland    123.78    57.25    118.15    133.19    88.95
Stavanger     Norway    118.61    39.83    106.09    143.54    118.14
Lugano     Switzerland    118.24    52.91    117.74    122.3    119.86
Oslo     Norway    117.23    49.28    112.42    124.09    102.94
Trondheim     Norway    114.22    42.39    103.5    134.76    108.29
Bergen     Norway    112.31    40.3    101.79    119.61    99.29
Kyoto     Japan    100.33    24.58    118.44    54.59    77.92
NewYork    US    100    100    100    100    100
Anchorage    US    94.99    40.12    101.18    84.55    124.92
Honolulu    US    94.15    62.82    104.69    82.86    103.08
Tokyo     Japan    93.81    37.07    99.67    58.93    106.42
Brooklyn    US    93.79    76.24    92.73    100.58    87.04
Paris     France    92.87    50.3    87.29    91.77    97.62
Rockville    US    92.66    64    87.76    74.74    130.79
Montpellier     France    90.63    24.95    86.93    75.13    74.25
London    UK    88.69    76.67    67.36    96.36    92.61
Grenoble     France    87.73    25.07    88.71    79.04    115.7
Boston     US    87.05    78.72    88.99    86.2    101.35
Nice     France    86.69    31.64    78.82    98.75    107.04
Perth     Australia    86.24    40.5    80.79    90.63    130.38
Adelaide     Australia    86.02    36.56    82.05    81.67    113.86
Miami     US    86.01    63.2    87.37    95.81    97.81
Bath    UK    85.79    37.62    78.47    83.51    117.98
Reading    UK    85.56    40.91    71.32    95.36    130.18
Melbourne     Australia    85.15    44.81    82.11    77.29    127.15
Darwin     Australia    84.98    46.52    82.29    91.79    118.09
Cairns     Australia    84.98    30.59    84.5    74.96    118.05
Lyon     France    84.47    28.04    77.74    79.13    101.17
Irvine    US    83.73    66.26    89.49    76.5    139.48
Philadelphia    US    83.46    48.09    82.24    79.37    116.06
Cambridge    UK    82.96    47.33    67.22    95.67    105.39
Toulouse     France    82.85    24.97    77.86    82.38    113.77
Brisbane     Australia    82.17    43.31    75.42    81.39    130.41
Oxford    UK    79.37    53.29    62.18    81.92    86.68
Osaka     Japan    78.5    23.88    79.2    45.06    109.62
Liverpool    UK    69.53    24.96    52.24    78.55    116.18
Brasilia     Brazil    53.84    16.73    44.65    47.74    49.33
Recife     Brazil    52.22    12.23    41.22    41.58    39.68
Ankara     Turkey    41.21    7.95    36.71    31.39    56.89
Izmir     Turkey    40.97    8.86    37.48    29.22    54.57
Bursa     Turkey    40.26    6.73    34.46    27.63    55.63
Gurgaon     India    34.9    10.96    32.59    30.88    110.97
Guadalajara     Mexico    34.19    10.12    33.15    30.82    71.87
Tijuana     Mexico    34.13    10.81    32.67    32.65    45.26
Hermosillo     Mexico    33.86    7.29    30.3    29.75    77.33
Queretaro     Mexico    33.51    9.52    33.17    27.96    63.18
Merida     Mexico    33.18    7.58    32.01    26.75    37.23
Puebla     Mexico    32.65    7.22    28.36    27.84    45.28
Mumbai     India    32.59    22.72    32.94    26.68    73.49
Noida     India    32.37    6.56    33.12    24.04    95.95
Delhi     India    32.14    9.74    30.67    27.54    78.33
Islamabad     Pakistan    30.83    8.79    28.5    23.5    43.2
Bangalore     India    30.34    9.76    31.47    20.23    100.26
Thane     India    29.82    9.3    31.07    21.18    70.55
Lahore     Pakistan    29.53    6.67    26.83    26.39    51.44
Chandigarh     India    29.04    6.47    29.4    20.18    68.83
Ahmedabad     India    28.67    6.24    31.42    20.13    73.59
Jaipur     India    27.11    5.19    27.65    18.48    76.5
Karachi     Pakistan    27.1    7.46    25.6    21.62    39.06
Hyderabad     India    26.92    6.89    27.6    18.93    80.9
Cairo     Egypt    26.49    5.43    23.23    22.55    25.27
Dnipropetrovsk     Ukraine    26.39    6.63    20.46    22.74    31.06
Nagpur     India    26.23    4.96    26.55    18.73    95.19
Mangalore     India    25.46    5.7    26.85    16.04    94.53
Lviv     Ukraine    25.31    8.1    20.5    17.88    26.88
Mysore     India    25.2    4.01    29.39    13.31    42.49
Kharkiv     Ukraine    24.85    8.29    19.26    18.44    27.19
Thiruvananthapuram     India    20.86    5.1    21.98    12.06    66.25
;
run;
proc sort data=citycosts out= bycostliving;
by country costliving ;
proc print data = bycostliving (obs=20);
by country;
var City Rent CostLiving ;
run;
ods rtf close;
title;
run;



/*3d*/

Data CityCosts ;   
length City $ 18
       Country $ 11;
Input City  $ Country  $ CostLiving Rent Groceries Restaurant PurchasePower;
AverageCost = (Rent+Groceries+Restaurant+PurchasePower)/(4);
Diff = (AverageCost - CostLiving);
datalines;
Zurich     Switzerland    141.25    66.14    149.86    135.76    142.7
Geneva     Switzerland    134.83    71.7    138.98    129.74    130.96
Basel     Switzerland    130.68    49.68    127.54    127.22    139.01
Bern     Switzerland    128.03    43.57    132.7    119.48    112.71
Reykjavik     Iceland    123.78    57.25    118.15    133.19    88.95
Stavanger     Norway    118.61    39.83    106.09    143.54    118.14
Lugano     Switzerland    118.24    52.91    117.74    122.3    119.86
Oslo     Norway    117.23    49.28    112.42    124.09    102.94
Trondheim     Norway    114.22    42.39    103.5    134.76    108.29
Bergen     Norway    112.31    40.3    101.79    119.61    99.29
Kyoto     Japan    100.33    24.58    118.44    54.59    77.92
NewYork    US    100    100    100    100    100
Anchorage    US    94.99    40.12    101.18    84.55    124.92
Honolulu    US    94.15    62.82    104.69    82.86    103.08
Tokyo     Japan    93.81    37.07    99.67    58.93    106.42
Brooklyn    US    93.79    76.24    92.73    100.58    87.04
Paris     France    92.87    50.3    87.29    91.77    97.62
Rockville    US    92.66    64    87.76    74.74    130.79
Montpellier     France    90.63    24.95    86.93    75.13    74.25
London    UK    88.69    76.67    67.36    96.36    92.61
Grenoble     France    87.73    25.07    88.71    79.04    115.7
Boston     US    87.05    78.72    88.99    86.2    101.35
Nice     France    86.69    31.64    78.82    98.75    107.04
Perth     Australia    86.24    40.5    80.79    90.63    130.38
Adelaide     Australia    86.02    36.56    82.05    81.67    113.86
Miami     US    86.01    63.2    87.37    95.81    97.81
Bath    UK    85.79    37.62    78.47    83.51    117.98
Reading    UK    85.56    40.91    71.32    95.36    130.18
Melbourne     Australia    85.15    44.81    82.11    77.29    127.15
Darwin     Australia    84.98    46.52    82.29    91.79    118.09
Cairns     Australia    84.98    30.59    84.5    74.96    118.05
Lyon     France    84.47    28.04    77.74    79.13    101.17
Irvine    US    83.73    66.26    89.49    76.5    139.48
Philadelphia    US    83.46    48.09    82.24    79.37    116.06
Cambridge    UK    82.96    47.33    67.22    95.67    105.39
Toulouse     France    82.85    24.97    77.86    82.38    113.77
Brisbane     Australia    82.17    43.31    75.42    81.39    130.41
Oxford    UK    79.37    53.29    62.18    81.92    86.68
Osaka     Japan    78.5    23.88    79.2    45.06    109.62
Liverpool    UK    69.53    24.96    52.24    78.55    116.18
Brasilia     Brazil    53.84    16.73    44.65    47.74    49.33
Recife     Brazil    52.22    12.23    41.22    41.58    39.68
Ankara     Turkey    41.21    7.95    36.71    31.39    56.89
Izmir     Turkey    40.97    8.86    37.48    29.22    54.57
Bursa     Turkey    40.26    6.73    34.46    27.63    55.63
Gurgaon     India    34.9    10.96    32.59    30.88    110.97
Guadalajara     Mexico    34.19    10.12    33.15    30.82    71.87
Tijuana     Mexico    34.13    10.81    32.67    32.65    45.26
Hermosillo     Mexico    33.86    7.29    30.3    29.75    77.33
Queretaro     Mexico    33.51    9.52    33.17    27.96    63.18
Merida     Mexico    33.18    7.58    32.01    26.75    37.23
Puebla     Mexico    32.65    7.22    28.36    27.84    45.28
Mumbai     India    32.59    22.72    32.94    26.68    73.49
Noida     India    32.37    6.56    33.12    24.04    95.95
Delhi     India    32.14    9.74    30.67    27.54    78.33
Islamabad     Pakistan    30.83    8.79    28.5    23.5    43.2
Bangalore     India    30.34    9.76    31.47    20.23    100.26
Thane     India    29.82    9.3    31.07    21.18    70.55
Lahore     Pakistan    29.53    6.67    26.83    26.39    51.44
Chandigarh     India    29.04    6.47    29.4    20.18    68.83
Ahmedabad     India    28.67    6.24    31.42    20.13    73.59
Jaipur     India    27.11    5.19    27.65    18.48    76.5
Karachi     Pakistan    27.1    7.46    25.6    21.62    39.06
Hyderabad     India    26.92    6.89    27.6    18.93    80.9
Cairo     Egypt    26.49    5.43    23.23    22.55    25.27
Dnipropetrovsk     Ukraine    26.39    6.63    20.46    22.74    31.06
Nagpur     India    26.23    4.96    26.55    18.73    95.19
Mangalore     India    25.46    5.7    26.85    16.04    94.53
Lviv     Ukraine    25.31    8.1    20.5    17.88    26.88
Mysore     India    25.2    4.01    29.39    13.31    42.49
Kharkiv     Ukraine    24.85    8.29    19.26    18.44    27.19
Thiruvananthapuram     India    20.86    5.1    21.98    12.06    66.25
;
run;
proc print data = citycosts (obs=12);
var AverageCost CostLiving Diff;
run;


/*3e*/
Data CityCosts ;   
length City $ 18
       Country $ 11;
Input City  $ Country  $ CostLiving Rent Groceries Restaurant PurchasePower;
WCost = (.65*Groceries + .35*Restaurant);
Diff2 = (WCost-Costliving);
datalines;
Zurich     Switzerland    141.25    66.14    149.86    135.76    142.7
Geneva     Switzerland    134.83    71.7    138.98    129.74    130.96
Basel     Switzerland    130.68    49.68    127.54    127.22    139.01
Bern     Switzerland    128.03    43.57    132.7    119.48    112.71
Reykjavik     Iceland    123.78    57.25    118.15    133.19    88.95
Stavanger     Norway    118.61    39.83    106.09    143.54    118.14
Lugano     Switzerland    118.24    52.91    117.74    122.3    119.86
Oslo     Norway    117.23    49.28    112.42    124.09    102.94
Trondheim     Norway    114.22    42.39    103.5    134.76    108.29
Bergen     Norway    112.31    40.3    101.79    119.61    99.29
Kyoto     Japan    100.33    24.58    118.44    54.59    77.92
NewYork    US    100    100    100    100    100
Anchorage    US    94.99    40.12    101.18    84.55    124.92
Honolulu    US    94.15    62.82    104.69    82.86    103.08
Tokyo     Japan    93.81    37.07    99.67    58.93    106.42
Brooklyn    US    93.79    76.24    92.73    100.58    87.04
Paris     France    92.87    50.3    87.29    91.77    97.62
Rockville    US    92.66    64    87.76    74.74    130.79
Montpellier     France    90.63    24.95    86.93    75.13    74.25
London    UK    88.69    76.67    67.36    96.36    92.61
Grenoble     France    87.73    25.07    88.71    79.04    115.7
Boston     US    87.05    78.72    88.99    86.2    101.35
Nice     France    86.69    31.64    78.82    98.75    107.04
Perth     Australia    86.24    40.5    80.79    90.63    130.38
Adelaide     Australia    86.02    36.56    82.05    81.67    113.86
Miami     US    86.01    63.2    87.37    95.81    97.81
Bath    UK    85.79    37.62    78.47    83.51    117.98
Reading    UK    85.56    40.91    71.32    95.36    130.18
Melbourne     Australia    85.15    44.81    82.11    77.29    127.15
Darwin     Australia    84.98    46.52    82.29    91.79    118.09
Cairns     Australia    84.98    30.59    84.5    74.96    118.05
Lyon     France    84.47    28.04    77.74    79.13    101.17
Irvine    US    83.73    66.26    89.49    76.5    139.48
Philadelphia    US    83.46    48.09    82.24    79.37    116.06
Cambridge    UK    82.96    47.33    67.22    95.67    105.39
Toulouse     France    82.85    24.97    77.86    82.38    113.77
Brisbane     Australia    82.17    43.31    75.42    81.39    130.41
Oxford    UK    79.37    53.29    62.18    81.92    86.68
Osaka     Japan    78.5    23.88    79.2    45.06    109.62
Liverpool    UK    69.53    24.96    52.24    78.55    116.18
Brasilia     Brazil    53.84    16.73    44.65    47.74    49.33
Recife     Brazil    52.22    12.23    41.22    41.58    39.68
Ankara     Turkey    41.21    7.95    36.71    31.39    56.89
Izmir     Turkey    40.97    8.86    37.48    29.22    54.57
Bursa     Turkey    40.26    6.73    34.46    27.63    55.63
Gurgaon     India    34.9    10.96    32.59    30.88    110.97
Guadalajara     Mexico    34.19    10.12    33.15    30.82    71.87
Tijuana     Mexico    34.13    10.81    32.67    32.65    45.26
Hermosillo     Mexico    33.86    7.29    30.3    29.75    77.33
Queretaro     Mexico    33.51    9.52    33.17    27.96    63.18
Merida     Mexico    33.18    7.58    32.01    26.75    37.23
Puebla     Mexico    32.65    7.22    28.36    27.84    45.28
Mumbai     India    32.59    22.72    32.94    26.68    73.49
Noida     India    32.37    6.56    33.12    24.04    95.95
Delhi     India    32.14    9.74    30.67    27.54    78.33
Islamabad     Pakistan    30.83    8.79    28.5    23.5    43.2
Bangalore     India    30.34    9.76    31.47    20.23    100.26
Thane     India    29.82    9.3    31.07    21.18    70.55
Lahore     Pakistan    29.53    6.67    26.83    26.39    51.44
Chandigarh     India    29.04    6.47    29.4    20.18    68.83
Ahmedabad     India    28.67    6.24    31.42    20.13    73.59
Jaipur     India    27.11    5.19    27.65    18.48    76.5
Karachi     Pakistan    27.1    7.46    25.6    21.62    39.06
Hyderabad     India    26.92    6.89    27.6    18.93    80.9
Cairo     Egypt    26.49    5.43    23.23    22.55    25.27
Dnipropetrovsk     Ukraine    26.39    6.63    20.46    22.74    31.06
Nagpur     India    26.23    4.96    26.55    18.73    95.19
Mangalore     India    25.46    5.7    26.85    16.04    94.53
Lviv     Ukraine    25.31    8.1    20.5    17.88    26.88
Mysore     India    25.2    4.01    29.39    13.31    42.49
Kharkiv     Ukraine    24.85    8.29    19.26    18.44    27.19
Thiruvananthapuram     India    20.86    5.1    21.98    12.06    66.25
;
run;
proc print data = citycosts (obs=12);
var Wcost CostLiving Diff2;
run;

ods text= '3f. When comparing Diff and Diff2, Diff takes into concideration more values so 
it gives a better estimate of costLiving';