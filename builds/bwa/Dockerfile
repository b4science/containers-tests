FROM biocontainers/bwa:v0.7.17_cv1
VOLUME /data
WORKDIR /data

ADD entrypoint.sh /usr/bin/run
# - "bwa mem genomes/{genome} {input} > {output}"
CMD [ "run" ]
