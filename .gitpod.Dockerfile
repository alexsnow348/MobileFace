FROM gitpod/workspace-full

# Install custom tools, runtimes, etc.
# For example "bastet", a command-line tetris clone:
# RUN brew install bastet
#
# More information: https://www.gitpod.io/docs/config-docker/
RUN sudo apt-get install build-essential cmake pkg-config && \
sudo apt-get install libx11-dev libatlas-base-dev && \
sudo apt-get install libgtk-3-dev libboost-python-dev &&\
sudo apt-get install python-dev python-pip python3-dev python3-pip && \
sudo -H pip2 install -U pip numpy && \
sudo -H pip3 install -U pip numpy 

RUN wget http://dlib.net/files/dlib-19.6.tar.bz2 && \
tar xvf dlib-19.6.tar.bz2 && \
cd dlib-19.6/ && \
mkdir build && \
cd build && \
cmake .. && \
cmake --build . --config Release && \
sudo make install && \
sudo ldconfig && \
cd .. 

RUN cd dlib-19.6 && \
python setup.py install && \
rm -rf dist && \
rm -rf tools/python/build && \
rm python_examples/dlib.so 

RUN pip install dlib