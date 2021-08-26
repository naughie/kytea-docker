FROM debian:buster AS kytea_builder

RUN apt update && \
    apt install -y git make g++ autoconf libtool

RUN git clone https://github.com/neubig/kytea.git /opt/kytea && \
    cd /opt/kytea && \
    autoreconf -i && \
    ./configure && \
    make && \
    make install

FROM debian:buster

COPY --from=kytea_builder /usr/local/lib/libkytea.* /usr/local/lib/
COPY --from=kytea_builder /usr/local/bin/kytea /usr/local/bin/train-kytea /usr/local/bin/
COPY --from=kytea_builder /usr/local/share/kytea/model.bin /usr/local/share/kytea/

ENV LD_LIBRARY_PATH=/usr/local/lib

ENTRYPOINT kytea
