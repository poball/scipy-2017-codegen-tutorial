#!/bin/bash -e
source activate codegen17
python setup.py install
for f in notebooks/{30,35,40,45,50}*.ipynb; do
    jupyter nbconvert --debug --ExecutePreprocessor.enabled=True --ExecutePreprocessor.timeout=300 --to=html $f
    jupyter nbconvert --debug --ExecutePreprocessor.enabled=True --ExecutePreprocessor.timeout=300 --to=notebook $f
done
mkdir deploy
mv notebooks/*.html deploy/
mv notebooks/*.nbconvert.ipynb deploy/
