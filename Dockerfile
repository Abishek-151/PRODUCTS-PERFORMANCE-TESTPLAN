FROM alphine/jmeter:5.6.3
WORKDIR /test
COPY Products Performance Test Plan.jmx /test/Products Performance Test Plan.jmx
ENTRYPOINT ["jmeter"]
