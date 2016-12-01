#!/usr/bin/env sh

models="GS108Tv2 GS108Tv1 GS728TP FS526Tv2 FS726T FS726Tv2 FS728TLP FS728TPv1 FS728TPv2 FS728TS FSM7226RS FSM726E FSM7326P FSM7352S GSM7212 GSS108E GSS116E GS105E GS105Ev2 GS105PE GS108Ev1 GS108Ev2 GS108Ev3 GS108PEv1 GS108PEv2 GS108Ev3 GS116E"

function getversion {
  local model=$1
  local url="http://www.netgear.com/support/product/$model.aspx";
  local version=`wget -qO - $url | grep 'accordion' | grep Firmware | /usr/bin/head -1  | sed 's/.*Version//' |sed -e 's/[^0-9\.]//g'`
  echo $model $version
}

for x in `echo $models` ; do
  getversion $x
done

