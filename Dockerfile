FROM r-base:4.0.0

COPY ./entrypoint.sh /

COPY ./init.R /

RUN apt update && \
    apt install -y  mecab mecab-ipadic-utf8 fonts-ipafont libmecab-dev libcurl4-openssl-dev libssl-dev && \
    Rscript /init.R && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
