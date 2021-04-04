schema custdemo

DATABASE custdemo 

GLOBALS 

TYPE d_type  RECORD
 
account STRING,
unitlabels STRING,
desc1 LIKE Orgnchart.HierachDesc,
desc2 LIKE Orgnchart.HierachDesc,
desc3 LIKE Orgnchart.HierachDesc,
desc4 LIKE Orgnchart.HierachDesc,
val1 LIKE Orgnchart.HierachDesc,
val2 LIKE Orgnchart.HierachDesc,
val3 LIKE Orgnchart.HierachDesc,
val4 LIKE Orgnchart.HierachDesc

END RECORD 
 
END GLOBALS