FROM alpine:3.12

ENV PGHOST='localhost'
ENV PGPORT='5432'
ENV PGDATABASE='postgres'
ENV PGUSER='postgres@postgres'
ENV PGPASSWORD='password'

RUN apk update
RUN apk add postgresql

COPY restore.sh .

ENTRYPOINT [ "/bin/sh" ]
CMD [ "./restore.sh" ]