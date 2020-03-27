FROM alpine

RUN apk --no-cache add ca-certificates davfs2 tini rsync inotify-tools tzdata && \
    mv /etc/davfs2 /etc/davfs2-dist

COPY sh/* /usr/local/bin/

VOLUME [ "/cldsync/drive", "/cldsync/config" ]

ENTRYPOINT [ "tini", "-g", "--", "/usr/local/bin/cldsync-entrypoint" ]
CMD [ "cldsync-inotify" ]
