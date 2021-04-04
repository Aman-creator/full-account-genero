GLOBALS "data_type.4gl"
SCHEMA custdemo


REPORT fullaccount(rec)
DEFINE rec d_type,
       account STRING,
       UnitLabel STRING,
       dict DICTIONARY OF INT
           

    FORMAT

        PAGE HEADER
            SKIP 2 LINES

            PRINT COLUMN 5, "Full Account",
                  COLUMN 30, "Organization",
                  COLUMN 45, "Department",
                  COLUMN 60, "Product",
                  COLUMN 70, "Location",
                  COLUMN 80, "Unit Labels"

            SKIP 1 LINES
                  

        ON EVERY ROW
        LET account = rec.account
        LET unitlabel = rec.unitlabels
        LET dict[rec.desc1] = rec.val1
        LET dict[rec.desc2] = rec.val2
        LET dict[rec.desc3] = rec.val3
        LET dict[rec.desc4] = rec.val4
    
         PRINT COLUMN 5, account,
                  COLUMN 31, dict["organisation"],
                  COLUMN 44, dict["odepartment"],
                  COLUMN 56, dict["product"],
                  COLUMN 66, dict["location"],
                  COLUMN 80, UnitLabel
                  

        ON LAST ROW
        
 
END REPORT 