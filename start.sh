#!/usr/bin/env bash
if [ ! -e venv ]
then
    virtualenv -p /usr/bin/python3.6 venv
fi
source venv/bin/activate
pip install -r requirements.txt
