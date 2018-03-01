FROM twongjirad/docker-ubuntu16.04-root:6.12.04_cuda9.1

MAINTAINER taritree.wongjirad@tufts.edu

RUN apt-get update && apt-get install -y python-pip && \
    	    pip install http://download.pytorch.org/whl/cu91/torch-0.3.1-cp27-cp27mu-linux_x86_64.whl \
	    && pip install torchvision \
	    && apt-get autoremove -y && apt-get clean -y

RUN bash -c "cd /usr/local && git clone https://github.com/larbys/larcv larcv && cd /usr/local/larcv \
    && source /usr/local/root/release/bin/thisroot.sh \
    && source configure.sh \
    && make"