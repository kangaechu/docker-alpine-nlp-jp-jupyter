FROM kangaechu/nlp-jp-py:latest

RUN apk add --update --no-cache sudo shadow && \
  apk add --no-cache --virtual .builddeps gcc g++ python3-dev musl-dev && \
  pip3 install jupyter && \
  apk del .builddeps && \
  useradd -m  nlp && \
  echo 'nlp ALL=NOPASSWD: /usr/bin/pip3' > /etc/sudoers

USER nlp
RUN mkdir -p /home/nlp/jupyter
WORKDIR /home/nlp/jupyter
COPY --chown=nlp:nlp jupyter .
CMD [ "/usr/bin/jupyter", "notebook", "--ip", "0.0.0.0" ]
EXPOSE 8888
VOLUME [ "/home/nlp/jupyter" ]