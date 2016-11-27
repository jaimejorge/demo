curl -i \
	 -d slaveId=0e2cc0eb-ecf9-4227-8a10-1f5dba35a7f3-S20 \
	 -d resources='[
		{
			"name": "cpus",
				"type": "SCALAR",
				"scalar": { "value": 3 },
				"role": "myriad",
				"reservation": {
					"principal": "myriad"
				}
		},
		{
			"name": "mem",
			"type": "SCALAR",
			"scalar": { "value": 4096 },
			"role": "myriad",
			"reservation": {
				"principal": "myriad"
			}
		}
]' \
	-X POST http://10.1.24.172:5050/master/reserve
