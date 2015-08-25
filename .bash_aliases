
function android_batch_install {

    if [ $# -lt 1 ] ;then
        echo "usage ${FUNCNAME[0]} path/to/application.apk"
        return;
    fi

    FILEPATH=$1

    if [ -f $FILEPATH ]; then
        DEVICES=`adb devices | grep device | grep -v attached | cut -f 1`
        for DEVICE in $DEVICES;
        do
            COMMAND="";
            echo "adb -s $DEVICE install -r $FILEPATH";
            adb -s $DEVICE install -r $FILEPATH
        done;
    else
        echo "$FILEPATH does not exist"
    fi
}

function jdb_attach {
  JDWP=`adb jdwp | tail -1`
  adb forward tcp:8888 jdwp:$JDWP
  jdb $1 -attach localhost:8888
}

alias :q="exit"

