#!/bin/bash
sed "s/IMGTAG/$1/g" dep.yaml  >  mydep.yaml
