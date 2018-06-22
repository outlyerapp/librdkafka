FROM gcc as build

ADD . .

RUN ./configure \
    && make


##################


FROM golang:1.10
COPY --from=build /src/librdkafka.so.1 /usr/lib/x86_64-linux-gnu/
