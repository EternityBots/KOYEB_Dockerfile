FROM fedora:37

RUN sudo dnf -y update &&\
    sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm &&\
    sudo dnf install -y git ffmpeg ImageMagick nodejs yarnpkg libwebp

RUN git clone https://github.com/EternityBots/Nezuko /root/EternityBots

RUN sudo yarn global add pm2

WORKDIR /root/EternityBots

RUN yarn

CMD ["pm2-runtime", "heart.js"]
