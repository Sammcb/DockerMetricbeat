while true; do
	metricbeat setup -e -E output.logstash.enabled=false -E output.elasticsearch.enabled=true && break
	sleep 5
done
metricbeat -e
