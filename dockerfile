FROM lballabio/boost:rolling
RUN sed -i 's/archive.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list
RUN sed -i 's/security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y openjdk-11-jdk-headless libxerces-c-dev build-essential openssh-client vim
COPY ./libs/jars /jars
ENV BOOST_INCLUDE=/usr/include
ENV BOOST_LIB=/usr/lib
ENV XERCES_INCLUDE=/usr/include
ENV XERCES_LIB=/usr/lib/x86_64-linux-gnu
ENV JARS_LIB=/jars/*
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV JAVA_INCLUDE=${JAVA_HOME}/include
ENV JAVA_LIB=${JAVA_HOME}/lib/server
COPY ./libs/tbb/lib/intel64/gcc4.8/* /usr/lib
ENV TBB_LIB=/usr/lib
COPY ./libs/tbb/include /usr/include
ENV TBB_INCLUDE=/usr/include
COPY ./libs/eigen /eigen
ENV EIGEN_INCLUDE=/eigen
RUN mkdir /gcam
COPY ./gcam-core /gcam
WORKDIR /gcam/cvs/objects/build/linux
RUN make gcam
WORKDIR /gcam
RUN chmod -R a+rwx /gcam