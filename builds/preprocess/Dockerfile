FROM rclone/rclone:1.52
VOLUME /data
WORKDIR /data
ADD entrypoint.sh /bin/run
# CMD [ "run" ]
ENTRYPOINT [ "/bin/run" ]
