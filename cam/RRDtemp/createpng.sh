#!/bin/bash

#get conf
source ../conf.sh

RRDPATH=${HOME_DIR}/RRDtemp
RAWCOLOUR="#FF0000"
RAWCOLOUR2="#0FAE0F"
RAWCOLOUR3="#B40486"
TRENDCOLOUR="#0000FF"

#hour
rrdtool graph $RRDPATH/mhour.png --start -6h -w 550 -h 200 \
DEF:intemp=$RRDPATH/multirPItemp.rrd:in_temp:AVERAGE \
DEF:outtemp=$RRDPATH/multirPItemp.rrd:out_temp:AVERAGE \
DEF:cputemp=$RRDPATH/multirPItemp.rrd:cpu_temp:AVERAGE \
CDEF:intrend=intemp,1200,TREND \
CDEF:outtrend=outtemp,1200,TREND \
CDEF:cputrend=cputemp,1200,TREND \
COMMENT:"        " \
COMMENT:"Min  " \
COMMENT:"Max  " \
COMMENT:"Moy  " \
COMMENT:"Dernier\l" \
LINE2:intemp$RAWCOLOUR:"t° cam" \
GPRINT:intemp:MIN:"%2.1lf°" \
GPRINT:intemp:MAX:"%2.1lf°" \
GPRINT:intemp:AVERAGE:"%2.1lf°" \
GPRINT:intemp:LAST:"%2.1lf°\l" \
LINE2:outtemp$RAWCOLOUR2:"t° ext" \
GPRINT:outtemp:MIN:"%2.1lf°" \
GPRINT:outtemp:MAX:"%2.1lf°" \
GPRINT:outtemp:AVERAGE:"%2.1lf°" \
GPRINT:outtemp:LAST:"%2.1lf°\l" \
LINE2:cputemp$RAWCOLOUR3:"t° cpu" \
GPRINT:cputemp:MIN:"%2.1lf°" \
GPRINT:cputemp:MAX:"%2.1lf°" \
GPRINT:cputemp:AVERAGE:"%2.1lf°" \
GPRINT:cputemp:LAST:"%2.1lf°\l" \


#day
rrdtool graph $RRDPATH/mday.png --start -1d -w 550 -h 200 \
DEF:intemp=$RRDPATH/multirPItemp.rrd:in_temp:AVERAGE \
DEF:outtemp=$RRDPATH/multirPItemp.rrd:out_temp:AVERAGE \
CDEF:intrend=intemp,1800,TREND \
CDEF:outtrend=outtemp,1800,TREND \
COMMENT:"        " \
COMMENT:"Min  " \
COMMENT:"Max  " \
COMMENT:"Moy  " \
COMMENT:"Dernier\l" \
LINE2:intemp$RAWCOLOUR:"t° cam" \
GPRINT:intemp:MIN:"%2.1lf°" \
GPRINT:intemp:MAX:"%2.1lf°" \
GPRINT:intemp:AVERAGE:"%2.1lf°" \
GPRINT:intemp:LAST:"%2.1lf°\l" \
LINE2:outtemp$RAWCOLOUR2:"t° ext" \
GPRINT:outtemp:MIN:"%2.1lf°" \
GPRINT:outtemp:MAX:"%2.1lf°" \
GPRINT:outtemp:AVERAGE:"%2.1lf°" \
GPRINT:outtemp:LAST:"%2.1lf °\l" \

#week
rrdtool graph $RRDPATH/mweek.png --start -1w -w 550 -h 200 \
DEF:intemp=$RRDPATH/multirPItemp.rrd:in_temp:AVERAGE \
DEF:outtemp=$RRDPATH/multirPItemp.rrd:out_temp:AVERAGE \
COMMENT:"        " \
COMMENT:"Min  " \
COMMENT:"Max  " \
COMMENT:"Moy  \l" \
LINE2:intemp$RAWCOLOUR:"t° cam" \
GPRINT:intemp:MIN:"%2.1lf°" \
GPRINT:intemp:MAX:"%2.1lf°" \
GPRINT:intemp:AVERAGE:"%2.1lf°\l" \
LINE2:outtemp$RAWCOLOUR2:"t° ext" \
GPRINT:outtemp:MIN:"%2.1lf°" \
GPRINT:outtemp:MAX:"%2.1lf°" \
GPRINT:outtemp:AVERAGE:"%2.1lf°\l" \

#month
rrdtool graph $RRDPATH/mmonth.png --start -1m -w 550 -h 200 \
DEF:intemp=$RRDPATH/multirPItemp.rrd:in_temp:AVERAGE \
DEF:outtemp=$RRDPATH/multirPItemp.rrd:out_temp:AVERAGE \
COMMENT:"        " \
COMMENT:"Min  " \
COMMENT:"Max  " \
COMMENT:"Moy  \l" \
LINE2:intemp$RAWCOLOUR:"t° cam" \
GPRINT:intemp:MIN:"%2.1lf°" \
GPRINT:intemp:MAX:"%2.1lf°" \
GPRINT:intemp:AVERAGE:"%2.1lf°\l" \
LINE2:outtemp$RAWCOLOUR2:"t° ext" \
GPRINT:outtemp:MIN:"%2.1lf°" \
GPRINT:outtemp:MAX:"%2.1lf°" \
GPRINT:outtemp:AVERAGE:"%2.1lf°\l" \


#year
rrdtool graph $RRDPATH/myear.png --start -1y -w 550 -h 200 \
DEF:intemp=$RRDPATH/multirPItemp.rrd:in_temp:AVERAGE \
DEF:outtemp=$RRDPATH/multirPItemp.rrd:out_temp:AVERAGE \
COMMENT:"        " \
COMMENT:"Min  " \
COMMENT:"Max  " \
COMMENT:"Moy  \l" \
LINE2:intemp$RAWCOLOUR:"t° cam" \
GPRINT:intemp:MIN:"%2.1lf°" \
GPRINT:intemp:MAX:"%2.1lf°" \
GPRINT:intemp:AVERAGE:"%2.1lf°\l" \
LINE2:outtemp$RAWCOLOUR2:"t° ext" \
GPRINT:outtemp:MIN:"%2.1lf°" \
GPRINT:outtemp:MAX:"%2.1lf°" \
GPRINT:outtemp:AVERAGE:"%2.1lf°\l" \

