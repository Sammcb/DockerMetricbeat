FROM debian:buster-slim

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
	gnupg2 \
	wget \
	ca-certificates

RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-7.x.list
ENV MB_HOME=/usr/share/metricbeat MB_CONF=/etc/metricbeat
RUN apt-get update && apt-get install -y --no-install-recommends \
	metricbeat

RUN apt-get purge -y gnupg2 wget ca-certificates && apt-get autoremove -y

COPY ./metricbeat.yml ${MB_CONF}/metricbeat.yml
RUN chmod go-w ${MB_CONF}/metricbeat.yml

COPY ./start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

EXPOSE 5066

CMD /usr/local/bin/start.sh
