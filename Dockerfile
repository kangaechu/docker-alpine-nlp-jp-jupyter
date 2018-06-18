FROM kangaechu/nlp-jp-py:latest

RUN apk add sudo shadow && \
  pip3 install jupyter && \
  useradd -m  jupyter && \
  echo 'jupyter ALL=NOPASSWD: /usr/bin/pip3' > /etc/sudoers

USER nlp
WORKDIR /home/nlp/jupyter
CMD [ "/usr/bin/jupyter", "notebook", "--ip", "0.0.0.0" ]
EXPOSE 8888
VOLUME [ "/home/nlp/jupyter" ]