
TRANSLATE=translate
HOST=localhost
PORT=1239

FILE1=/tmp/translate1-$$
FILE2=/tmp/translate2-$$
ERROR=/tmp/translate-err-$$
FILERT=/tmp/translate3-$$

GETTEXT="gettext -d translate_ui"

curl -s "http://semes-olla.rhcloud.com/words?Swadesh/English.py" | paste - - - - - - > $FILERT


if [ -r ~/.translate.conf ]
then
	. ~/.lang.conf
elif [ -r /etc/lang.conf ]
then
	. /etc/lang.conf
fi

which gdialog 2> /dev/null && DIALOG=gdialog || DIALOG=dialog

help () {
        echo "Usage: $0 [ host [port] | --help ]"
}

end () {
	rm -f $FILE1 $FILE2 $ERROR
	exit
}

if [ $# -eq 1 ]
then
        if [ $1 -eq '--help' ]
        then
                help
                exit -1
        else
                HOST=$1
        fi
elif [ $# -eq 2 ]
then
        PORT=$2
fi

if [ $# -ge 1 -o `basename $0` = 'ntranslate_ui' ]
then
	if [ $HOST -a $PORT ]
	then
	        TRANSLATE="nc $HOST $PORT"
	else
		echo "You must set HOST and PORT"
		exit -2
	fi
fi

while true
do
	$DIALOG --inputbox "`cat $FILERT`\\n\\n`$GETTEXT \"Enter the number of the word to be translated:\"`" 8 35 2> $FILE1 || end
	curl -s "http://semes-olla.rhcloud.com/word?`cat $FILE1`&Swadesh/Hindi.py" > $FILE2
	if [ -s $FILE2 ]
	then
		MSG="`$GETTEXT \"Result:\"` `cat $FILE2`\\n\\n`$GETTEXT \"Continue?\"`"
	        $DIALOG --yesno "$MSG" 7 20 || end
	else
	   
		MSG="`$GETTEXT \"Error:\"`\\n\\n`cat $ERROR`\\n\\n`$GETTEXT \"Continue?\"`"
		$DIALOG --yesno "$MSG" 10 35 || end
		
	fi
done
