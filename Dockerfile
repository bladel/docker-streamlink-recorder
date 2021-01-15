FROM python:3.9.1-slim-buster
LABEL maintainer="lauwarm@mailbox.org"

ENV streamlinkVersion=2.0.0

ADD https://github.com/streamlink/streamlink/releases/download/${streamlinkVersion}/streamlink-${streamlinkVersion}.tar.gz /opt/

RUN tar -xzf /opt/streamlink-${streamlinkVersion}.tar.gz -C /opt/ && \
	rm /opt/streamlink-${streamlinkVersion}.tar.gz && \
	cd /opt/streamlink-${streamlinkVersion}/ && \
	python setup.py install

RUN mkdir /home/download
RUN mkdir /home/script
COPY ./streamlink-recorder.sh /home/script/

CMD /bin/sh ./home/script/streamlink-recorder.sh ${streamOptions} ${streamLink} ${streamQuality} ${streamName}