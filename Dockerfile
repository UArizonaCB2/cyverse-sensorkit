FROM ubuntu
MAINTAINER Shravan Aras <shravanaras@arizona.edu>

USER root

RUN apt-get update && \
    apt-get install -y python3 python3-pip git && \
    apt-get clean 

RUN mkdir /sensorkit/

WORKDIR /sensorkit

RUN git clone https://github.com/UArizonaCB2/sensorfabric-py.git
RUN git clone https://github.com/UArizonaCB2/sensorkit-mdh.git

RUN mkdir /sensorkit/sensorkit-mdh/mdh_exports 

COPY createJson.py .

ENV PYTHONPATH=/sensorkit/sensorfabric-py/

WORKDIR /sensorkit/sensorkit-mdh
RUN pip3 install -r requirements.txt

COPY entry.sh /bin
ENTRYPOINT ["bash", "/bin/entry.sh"]
