Get-ChildItem $args[0] -Filter Location.*.ndjson | 
Foreach-Object {
	((Get-Content $_.FullName) -replace '"managingOrganization":{"identifier":{"system":"[^"]+","value":"([a-z0-9-]+)"}','"managingOrganization":{"reference":"Organization/$1"') | Set-Content $_.FullName
}
Get-ChildItem $args[0] -Filter PractitionerRole.*.ndjson | 
Foreach-Object {
	((((Get-Content $_.FullName) -replace '"practitioner":{"identifier":{"system":"[^"]+","value":"([0-9]+)"}','"practitioner":{"reference":"Practitioner/$1"') -replace '"organization":{"identifier":{"system":"[^"]+","value":"([a-z0-9-]+)"}','"organization":{"reference":"Organization/$1"') -replace '"location":\[{"identifier":{"system":"[^"]+","value":"([a-z0-9-]+)"}','"location":[{"reference":"Location/$1"') | Set-Content $_.FullName
}
Get-ChildItem $args[0] -Filter Practitioner.*.ndjson | 
Foreach-Object {
	((Get-Content $_.FullName) -replace '"id":"([a-z0-9-]+)",(.+),"identifier":\[{"system":"([^"]+)","value":"([a-z0-9-]+)"}]','"id":"$4",$2,"identifier":[{"system":"$3","value":"$4"}]') | Set-Content $_.FullName
}
Get-ChildItem $args[0] -Filter *.ndjson | 
Foreach-Object {
	((Get-Content $_.FullName) -replace '\?identifier\=[^\|]+\|','/') | Set-Content $_.FullName
}