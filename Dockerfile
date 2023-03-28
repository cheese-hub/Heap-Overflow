# Use an existing image with the GCC compiler
FROM i386/ubuntu:20.04

# Install the necessary packages

RUN apt-get update && apt-get install -y \
    build-essential \
    gcc
RUN apt-get install -y vim
RUN apt-get install -y wget
RUN apt-get install -y make
RUN cd /tmp \
    && wget https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tar.xz \
    && tar xf Python-2.7.18.tar.xz \
    && cd Python-2.7.18 \
    && ./configure \
    && make \
    && make install

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y  gdb



RUN /sbin/sysctl -w kernel.randomize_va_space=0


# Create a directory for the program

RUN mkdir /app
WORKDIR /app

# Copy the program source code into the container
COPY ./ ./
RUN gcc -static -g -fno-stack-protector -z execstack -w -o heapoverflow_vulnerability heapoverflow_vulnerability.c
RUN gcc -static -g -fno-stack-protector -z execstack -w -o understand_heap understand_heap.c


# Compile the program
# RUN gcc -o heapoverflow heapoverflow.c

# Run the program
CMD ["bash"]
