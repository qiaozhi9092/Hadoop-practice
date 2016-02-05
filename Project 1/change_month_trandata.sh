###  This shell scripts changes the month of certain transactions

inputfile=$1
outputfile=$2

cat $inputfile|awk -F, '{if ($4=="0808" || $4=="1010") print $0}'|sed -e 's/,4\//,5\//g' > tmp1

cat $inputfile|awk -F, '{if ($4!="0808" && $4!="1010") print $0}' > tmp2

cat tmp1 tmp2 |sort |gzip -6qN > $outputfile.gz


rm tmp*
