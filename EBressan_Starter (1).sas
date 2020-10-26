/*Emily Bressan Starter Assigment*/
/*I certify that the SAS code given is my original and exclusive work*/


Data Starter;  /* Inserted missing semicolon after datalines*/
Input FirstName $ 1-6 /* Inserted $ after FirstName due to character values*/
      Age        8-9; /* Change colum range age from 9-10 to 8-9*/
Datalines; 
Ned    18
Nicole 22
Xin    23
Maria  30
Justin 17
Josue  26
;
run;
/*2(a)*/
ods text= 'The first mistake occured in the Data Starter, it was missing a semicolon.';

proc print data= starter; /* Change spelling from stater to starter*/
run;
/*5(a)*/
ods text= 'In the table the oldest person is Maria and the youngest is Justin';