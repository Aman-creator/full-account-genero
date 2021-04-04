IMPORT fgl fullacc_rep_format
SCHEMA custdemo


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
 
MAIN 

DEFINE rec d_type

CONNECT TO "custdemo" USER "sa" USING "aman"

DECLARE cur CURSOR FOR 
SELECT
concat(A.Hierachvalue,'-',B.Hierachvalue,'-',c.Hierachvalue,'-',d.Hierachvalue) AS account,
concat(A.HierachDesc,'-',B.HierachDesc,'-',c.HierachDesc,'-',d.HierachDesc) AS  budget_unit,
A.HierachDesc ,B.HierachDesc  ,c.HierachDesc  ,d.HierachDesc ,
A.Hierachvalue ,B.Hierachvalue  ,c.Hierachvalue  ,d.Hierachvalue 
FROM  Orgnchart A, Orgnchart B, Orgnchart c, Orgnchart d
WHERE  A.Id = B.Parent_Id And B.Id = c.Parent_Id AND c.Id = d.Parent_Id

 FOREACH cur INTO rec.*
    DISPLAY rec.account||" "||rec.desc1||" "||rec.val1
    
    END FOREACH 


START REPORT fullaccount TO FILE "full_account.txt"

    FOREACH cur INTO rec.*
   -- DISPLAY rec.account||" "||rec.desc1
    WHENEVER ERROR CONTINUE 
        OUTPUT TO REPORT fullaccount(rec.*)
        WHENEVER ERROR STOP 
    END FOREACH 

FINISH REPORT fullaccount

DISCONNECT CURRENT 
END MAIN 