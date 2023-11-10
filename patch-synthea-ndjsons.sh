#!/bin/bash
for file in "$1"/Location.*.ndjson; do
  sed -i 's/"managingOrganization":{"identifier":{"system":"[^"]*","value":"\([a-z0-9][a-z0-9-]*\)"}/"managingOrganization":{"reference":"Organization\/\1"/g' $file
done

for file in "$1"/PractitionerRole.*.ndjson; do
  sed -i 's/"practitioner":{"identifier":{"system":"[^"]*","value":"\([0-9]*\)"}/"practitioner":{"reference":"Practitioner\/\1"/g' $file
  sed -i 's/"organization":{"identifier":{"system":"[^"]*","value":"\([a-z0-9][a-z0-9-]*\)"}/"organization":{"reference":"Organization\/\1"/g' $file
  sed -i 's/"location":\[{"identifier":{"system":"[^"]*","value":"\([a-z0-9][a-z0-9-]*\)"}/"location":[{"reference":"Location\/\1"/g' $file
done

for file in "$1"/Practitioner.*.ndjson; do
  sed -i 's/"id":"\([a-z0-9-]*\)",\(.*\),"identifier":\[{"system":"\([^"]*\)","value":"\([a-z0-9-]*\)"}\]/"id":"\4",\2,"identifier":[{"system":"\3","value":"\4"}]/g' $file
done

for file in "$1"/*.ndjson; do
  sed -i 's/\?identifier=[^|]*|/\//g' $file
done





