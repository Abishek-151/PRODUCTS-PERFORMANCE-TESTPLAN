FROM alpine/jmeter:5.6.3
WORKDIR /test
RUN wget -q
https://jmeter-plugins.org/files/packages/jpgc-casutg-3.1.1.zip\ && unzip -q jpgc-casutg-3.1.1.zip -d /tmp/castug \ && cp /tmp/casutg/lib/ext/*.jar /opt/apache-jmeter/lib/ext/ \ && cp /tmp/casutg/lib/*.jar /opt/apache-jmeter/lib/ \ && rm -rf /tmp/casutg jpgc-casutg-3.1.1.zip
COPY ["Products Performance Test Plan.jmx","/test/Products Performance Test Plan.jmx"]
ENTRYPOINT ["jmeter"]
