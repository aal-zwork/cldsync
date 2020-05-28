FROM alpine

ENV CLD_URL=
ENV CLD_USERNAME=
ENV CLD_PASSWORD=

ENV CLD_MOUNT=/mnt/webdrive
ENV CLD_UID=0
ENV CLD_GID=0
ENV CLD_DIRMODE=755
ENV CLD_FILEMODE=755

ENV CLD_LOOP_PERIOD=10

ENV CLD_SRC=/mnt/src
ENV CLD_SUBPATH=/
ENV CLD_INOTIFY_EXCLUDE=
ENV CLD_FORCE_TIMESYNC=300

RUN apk --no-cache add ca-certificates davfs2 tini rsync inotify-tools tzdata

COPY sh/* /usr/local/bin/

VOLUME [ "/etc/davfs2" ]

ENTRYPOINT [ "tini", "-g", "--", "/usr/local/bin/cldsync-entrypoint" ]
CMD [ "cldsync-inotify" ]
