#!/usr/bin/env bash

name=$NAME
echo "name: $name"

type=$TYPE
echo "type: $type"

set -ex

wget -qq https://huggingface.co/rhasspy/piper-voices/resolve/main/en/en_US/$name/$type/en_US-$name-low.onnx
wget -qq https://huggingface.co/rhasspy/piper-voices/resolve/main/en/en_US/$name/$type/en_US-$name-low.onnx.json
wget -qq https://huggingface.co/rhasspy/piper-voices/resolve/main/en/en_US/$name/$type/MODEL_CARD

pip install piper-phonemize onnx onnxruntime==1.16.0

wget -qq https://people.umass.edu/nconstan/CMU-IPA/CMU-in-IPA.zip
unzip CMU-in-IPA.zip

echo "pwd: $PWD"
head CMU.in.IPA.txt

python3 ./vits-piper-en_US.py
