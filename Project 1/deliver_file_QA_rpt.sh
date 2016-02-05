########################################
###  Script:  deliver_file_QA_rpt.sh  ##
###  Analyst: Hong Gu                 ##
###  Purpose: QA major fields in the  ##
###           to be delivered txtfile ##
###  QA Field:                        ##
###          * Total Records          ##
###          * ACCT                   ##
###          * MCC                    ##
###          * CARD TYPE              ##
###          * MONTH                  ##
########################################

filenm=$1

##  count total record

echo "================================"
echo " Total Number of Record in:"
echo " Filename: '$filenm'    "
echo "================================"

cat $filenm|wc -l

echo "================================"

echo "  "
echo "  "
echo "  "

## check if ACCT has missing values

echo "================================"
echo "Checking missing ACCT value "
echo "--------------------------------"
echo "Total Num of ACCT value:"

cut -c1-4 $filenm |wc -l

echo "--------------------------------"
echo "Total Missing ACCT value:"

cut -c1-4 $filenm | grep ' '|wc -l

echo "================================"

echo "  "
echo "  "
echo "  "

## check if MCC has missing values

echo "================================"
echo "Checking missing MCC value "
echo "--------------------------------"
echo "Total Num of MCC value:"

cut -c21-24 $filenm |wc -l

echo "--------------------------------"
echo "Total Missing MCC value:"

cut -c21-24 $filenm | grep ' '|wc -l

echo "================================"


echo "  "
echo "  "
echo "  "

## Check the number of unique account number

echo "================================"
echo "Number of Unique ACCT:"

cut -c1-4 $filenm |sort -u|wc -l
echo "================================"

echo "  "
echo "  "
echo "  "

## Check the number of unique Card Type

echo "================================"
echo "Number of Unique Card Type:"

cut -c25 $filenm |sort -u|wc -l

echo "================================"

echo "  "
echo "  "
echo "  "

## Check the Year and Month of Transactions

echo "================================="
echo "The Month of Listed Transactions:"
echo "---------------------------------"

cut -c5-6 $filenm |sort -u

echo "---------------------------------"
echo "The Year of Listed Transactions:"
echo "---------------------------------"

cut -c11-14 $filenm |sort -u

echo "================================="

echo "  "
echo "  "
echo "  "
echo "====================="
echo "    End of Report    "
echo "====================="

