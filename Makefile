include .env

export:
	cp BreakinIn/config.example.json BreakinIn/config.json
	sed -i "s/{{SERVER_IP}}/${SERVER_IP}/g" BreakinIn/config.json
	cp conf/dnsmasq/breakin-in.conf ../../dns/dnsmasq.d/breakin-in.conf
	sed -i "s/{{SERVER_IP}}/${SERVER_IP}/g" ../../dns/dnsmasq.d/breakin-in.conf
	cp docker-compose.yaml ../../docker-compose.breakin-in.yaml