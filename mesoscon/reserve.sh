curl -i \
	 -u myriad:myriad \
	 -d slaveId=3fd7e6dc-26d0-4d5c-9b35-5e92c0e69bcb-S1 \
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
	-X POST http://172.17.0.4:5050/master/reserve
