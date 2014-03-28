#!/bin/bash
rrdtool create multirPItemp.rrd  --step 300 \
DS:in_temp:GAUGE:600:-30:50 \
DS:out_temp:GAUGE:600:-30:50 \
DS:cpu_temp:GAUGE:600:-30:70 \
RRA:AVERAGE:0.5:1:12 \
RRA:AVERAGE:0.5:1:288 \
RRA:AVERAGE:0.5:12:168 \
RRA:AVERAGE:0.5:12:720 \
RRA:AVERAGE:0.5:288:365 \
RRA:MIN:0.5:1:12 \
RRA:MAX:0.5:1:12 \
RRA:MIN:0.5:1:288 \
RRA:MAX:0.5:1:288 \
RRA:MIN:0.5:12:168 \
RRA:MAX:0.5:12:168 \
RRA:MIN:0.5:12:720 \
RRA:MAX:0.5:12:720 \
RRA:MIN:0.5:288:365 \
RRA:MAX:0.5:288:365

