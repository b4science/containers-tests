# FROM nickgryg/alpine-pandas:3.8.5
#FROM python:3.8.5-slim
FROM python:3.8.6-slim
#FROM python:3.9.0-slim
RUN pip3 install --no-cache-dir \
    ipython notebook jupyter pandas matplotlib seaborn watermark RISE

WORKDIR /
RUN mkdir -p /files
ADD example.ipynb /files/

ADD entrypoint.sh /usr/bin/run
CMD [ "run" ]
EXPOSE 8888
# VOLUME /data
