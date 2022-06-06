FROM public.ecr.aws/debian/debian:buster-slim as base_image
WORKDIR /vroom

RUN echo "Updating apt-get and installing dependencies..." && \
  apt-get -y update > /dev/null && apt-get -y install > /dev/null \
  git-core \
  build-essential \
	g++ \
  libssl-dev \
	libasio-dev \
  libglpk-dev \
	pkg-config
FROM base_image as build_image
COPY . .
RUN git init && git submodule update --init --recursive && git status && ls -lah && ls -lah lib exit 1
# RUN USE_ROUTING=false make -C /vroom/src -j$(nproc)
# FROM scratch
# COPY --from=build_image /vroom/bin/vroom /usr/local/bin/vroom





