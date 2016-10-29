curl -i \
	 -u myriad:myriad \
	 -d slaveId=a1e049c1-6e92-414f-8d81-a4f19fbc9b05-S0 \
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
	-X POST http://172.17.0.2:5050/master/reserve
