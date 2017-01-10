FROM phusion/baseimage:0.9.15

MAINTAINER Ain Tohvri <ain@interactive-pioneers.de>

ENV RUBY_VERSION 2.2.2
ENV USERNAME deploy
ENV HOME /home/$USERNAME

RUN apt-get update && apt-get install -y build-essential wget

RUN locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8

# Create user account
RUN adduser --home $HOME --disabled-password --gecos '' $USERNAME
RUN echo "%$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $USERNAME
RUN mkdir -p $HOME/.ssh && touch $HOME/.ssh/known_hosts

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN curl -L https://get.rvm.io | bash -s stable --ruby=$RUBY_VERSION --gems=bundler

CMD ["bash", "-l"]
