# OpenBike

OpenBike is an open source bikesharing system.

## Project overview

![](/img/openbike_structure.svg)

* [„Cykel“](https://github.com/stadtulm/cykel) (django backend)
* [„Voorwiel“](https://github.com/stadtulm/voorwiel) (customer frontend website)
* Tracker
	* [Dragino LGT-92 Tracker firmware](https://github.com/dragino/LGT-92_-LoRa_GPS_Tracker/)
	* [Dragino LGT-92 Tracker hardware](https://github.com/dragino/Lora/tree/master/LGT-92)
	* [Wifi Tracker firmware](https://github.com/stadtulm/Lora-Wifi-Location-Tracker)
	* [Wifi Tracker hardware „Lortinchen“](https://github.com/stadtulm/Lora-Wifi-Location-Tracker/tree/master/hardware)
	* [Manual Tracker from Eigenbaukombinat](https://github.com/Eigenbaukombinat/cykel-manual-tracker)
* TTN Adapter
	* [Dragino decoder](https://github.com/stadtulm/tracker-ttn-decoders/blob/master/lgt92-1.5.1.js)
	* [Wifi Tracker decoder](https://github.com/stadtulm/Lora-Wifi-Location-Tracker/blob/master/ttn-decoder-script.js)
	* [Cykel-TTN Adapter for GPS-Trackers](https://github.com/stadtulm/cykel-ttn)
	* [Cykel-TTN Adapter for Wifi-Trackers](https://github.com/stadtulm/cykel-ttn-wifi)


## Docker

```
git clone -b docker https://github.com/exmatrikulator/OpenBike
cd OpenBike
git clone -b docker https://github.com/exmatrikulator/cykel
git clone -b docker https://github.com/exmatrikulator/cykel-manual-tracker
git clone -b docker https://github.com/exmatrikulator/cykel-ttn-wifi
git clone -b docker https://github.com/exmatrikulator/voorwiel
```

Copy docker-compose.secret.sample.yml to docker-compose.secret.yml and adjust on your needs. 

You may want to set the NODE_ENV in _docker-compose.yml_ if have an alternative config for voorwiel.

### Debug / Develop
```
docker-compose -f docker-compose.yml -f docker-compose.override.yml -f docker-compose.secret.yml up -d --build
```

### Production
```
docker-compose -f docker-compose.yml -f docker-compose.production.yml -f docker-compose.secret.yml up -d --build
```

### General

Wait and visit http://localhost/ or http://localhost:8000/admin for Django Backend.

Create Super User to login:
```
docker-compose exec cykel python manage.py createsuperuser
```

