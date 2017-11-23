#!/usr/bin/ksh
#set

date=`/bin/date "+%Y-%m-%d%n"`

SEARCHCRITERIA1="mechanical+engineer"
EMAIL="cupricreki@gmail.com"

westslope_process () {
    x=westslope
wget "http://$x.craigslist.org/search/?areaID=678&catAbb=sss&query=$SEARCHCRITERIA1&sort=priceasc&format=rss" -O /tmp/$x.index.html
cat /tmp/$x.index.html | egrep "\<title\>|\<link\>" | grep -v dc: | sed '/link/G' | sed 's/<link>//g' | sed 's/<\/link>//g' | sed 's/<title>//g' | sed 's/<\/title>//g' | sed 's/<\!\[CDATA\[//g' | sed 's/\]\]>//g' > /tmp/$x.index2.txt
}

bend_process () {
    y=bend	#Bend Oregon: https://www.google.com/maps/place/Bend,+OR/@44.0612976,-121.4547289,11z/data=!3m1!4b1!4m2!3m1!1s0x54b8c0ffa5d3d251:0x1088e7acc720d1b4
wget "http://$y.craigslist.org/search/?areaID=678&catAbb=sss&query=$SEARCHCRITERIA1&sort=priceasc&format=rss" -O /tmp/$y.index.html
cat /tmp/$y.index.html | egrep "\<title\>|\<link\>" | grep -v dc: | sed '/link/G' | sed 's/<link>//g' | sed 's/<\/link>//g' | sed 's/<title>//g' | sed 's/<\/title>//g' | sed 's/<\!\[CDATA\[//g' | sed 's/\]\]>//g' > /tmp/$y.index2.txt
}

portlant_process () {
    z=portland
wget "http://$z.craigslist.org/search/?areaID=678&catAbb=sss&query=$SEARCHCRITERIA1&sort=priceasc&format=rss" -O /tmp/$z.index.html
cat /tmp/$z.index.html | egrep "\<title\>|\<link\>" | grep -v dc: | sed '/link/G' | sed 's/<link>//g' | sed 's/<\/link>//g' | sed 's/<title>//g' | sed 's/<\/title>//g' | sed 's/<\!\[CDATA\[//g' | sed 's/\]\]>//g' > /tmp/$z.index2.txt
}

banner_process () {
    FILENAME=$SEARCHCRITERIA1.txt
touch /tmp/$FILENAME
echo "Craigslist Search routine for $date" >>  /tmp/$FILENAME
echo "Search Criteria: $SEARCHCRITERIA1" >> /tmp/$FILENAME
echo >> /tmp/$FILENAME 
cat /tmp/$x.index2.txt >> /tmp/$FILENAME
echo >> /tmp/$FILENAME
cat /tmp/$y.index2.txt >> /tmp/$FILENAME
echo >> /tmp/$FILENAME
cat /tmp/$z.index2.txt >> /tmp/$FILENAME
}

cleanup_process () {
    rm /tmp/*.index.html
    rm /tmp/*.index2.txt
    rm /tmp/$SEARCHCRITERIA1.txt
}

mail_process () {
    /usr/bin/mail -s "[ Craigslist SearchBot: $SEARCHCRITERIA1 ]" "$EMAIL" < /tmp/$FILENAME
}

#
#
westslope_process
bend_process
portlant_process
banner_process
mail_process
cleanup_process

exit 1
