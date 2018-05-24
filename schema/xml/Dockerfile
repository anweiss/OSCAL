FROM openjdk:8-jre
RUN apt-get update && \
    apt-get install -y git libxml2 libxml2-utils
RUN wget -O saxon9he.zip "https://downloads.sourceforge.net/project/saxon/Saxon-HE/9.8/SaxonHE9-8-0-12J.zip?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fsaxon%2Ffiles%2FSaxon-HE%2F9.8%2FSaxonHE9-8-0-12J.zip%2Fdownload&ts=1527114708" && \
    mkdir saxon && \
    mv saxon9he.zip saxon/ && \
    cd saxon && \
    unzip saxon9he.zip
ENV SAXON_HOME=/saxon
ENV XSPEC_HOME=/xspec
RUN git clone https://github.com/xspec/xspec.git
RUN cp /xspec/bin/xspec.sh /usr/local/bin/xspec && \
    echo "#!/bin/sh" >> /usr/local/bin/saxon && \
    echo 'java -jar /saxon/saxon9he.jar "$*"' >> /usr/local/bin/saxon && \
    chmod +x /usr/local/bin/saxon
WORKDIR /oscal-schema
COPY oscal*.xsd ./
