FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:fkrull/deadsnakes
RUN apt-get update
RUN apt-get install -y --no-install-recommends python3.6 python3.6-dev python3-pip python3-setuptools python3-wheel gcc
RUN apt-get install -y vim
RUN python3.6 -m pip install pip --upgrade

# 현재 디렉토리의 모든 파일을 도커 컨테이너의 /workdir 로 copy 
ADD . /workdir

# 작업 디렉토리로 이동
WORKDIR /workdir

# 작업 디렉토리에 있는 pip-req 를 이용해 필요한 pip들 설치
RUN pip install -r misc/pip-req

