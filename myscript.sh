#!/bin/bash
for i in {1..1}
do
echo "Executing request $i"
time curl -X POST -H "Content-Type: application/json" -d '{
    "Client": "Postman Demo",
    "PackageId": "246318f4-1f50-4040-b48b-9210c04d53b0",
    "Inputs": [
        {
            "key": "UniqueID",
            "value": "TestMortBasis6"
        },
        {
            "key": "StartDate",
            "value": "01/01/2017"
        },
        {
            "key": "GuarTerm",
            "value": "0"
        },
        {
            "key": "GuarOverlap",
            "value": "N"
        },
        {
            "key": "LifeBasis",
            "value": "JLF"
        },
        {
            "key": "Lifestyle_Factor",
            "value": "2"
        },
        {
            "key": "Age1",
            "value": "55"
        },
        {
            "key": "Sex1",
            "value": "M"
        },
        {
            "key": "Smoker1",
            "value": "Y"
        },
        {
            "key": "MortAgeAdj1",
            "value": "0"
        },
        {
            "key": "MortMult1",
            "value": "1"
        },
        {
            "key": "DthDate1",
            "value": "01/01/0001"
        },
        {
            "key": "Age2",
            "value": "50"
        },
        {
            "key": "Sex2",
            "value": "F"
        },
        {
            "key": "Smoker2",
            "value": "N"
        },
        {
            "key": "MortAgeAdj2",
            "value": "0"
        },
        {
            "key": "MortMult2",
            "value": "1"
        },
        {
            "key": "DthDate2",
            "value": "01/01/0001"
        },
        {
            "key": "PremAmt",
            "value": ""
        },
        {
            "key": "AntyAmt",
            "value": "12000"
        },
        {
            "key": "AntyFreq",
            "value": "12"
        },
        {
            "key": "Advance",
            "value": "Y"
        },
        {
            "key": "EscType",
            "value": "FIXED"
        },
        {
            "key": "EscRate",
            "value": "0"
        },
        {
            "key": "RevRate",
            "value": "0"
        },
        {
            "key": "UnknownValue",
            "value": "PurchasePrice"
        }
    ]
}' http://172.31.96.1:49009/api/v1/quotes | jq
done
