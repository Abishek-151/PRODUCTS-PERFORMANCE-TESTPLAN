FROM alpine/jmeter:5.6.3
WORKDIR /test
RUN wget -q https://repo.maven.apache.org/maven2/kg/apc/jmeter-plugins-casutg/3.1.1/jmeter-plugins-casutg-3.1.1.jar -O /opt/apache-jmeter-5.6.3/lib/ext/jmeter-plugins-casutg-3.1.1.jar && wget -q https://repo.maven.apache.org/maven2/kg/apc/jmeter-plugins-cmn-jmeter/0.7/jmeter-plugins-cmn-jmeter-0.7.jar -O /opt/apache-jmeter-5.6.3/lib/jmeter-plugins-cmn-jmeter-0.7.jar
COPY ["Products Performance Test Plan.jmx", "/test/Products Performance Test Plan.jmx"]
ENTRYPOINT ["jmeter"]
