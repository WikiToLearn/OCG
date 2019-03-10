FROM node:6
ADD ./docker-apt-get-install.sh /docker-apt-get-install.sh

MAINTAINER wikitolearn sysadmin@wikitolearn.org
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN /docker-apt-get-install.sh zip
RUN /docker-apt-get-install.sh nano
RUN /docker-apt-get-install.sh apt-utils
RUN /docker-apt-get-install.sh rsync
RUN /docker-apt-get-install.sh ocaml
RUN /docker-apt-get-install.sh screen
RUN /docker-apt-get-install.sh sudo
RUN /docker-apt-get-install.sh redis-server
RUN /docker-apt-get-install.sh build-essential
RUN /docker-apt-get-install.sh nodejs
RUN /docker-apt-get-install.sh poppler-utils
RUN /docker-apt-get-install.sh librsvg2-bin
RUN /docker-apt-get-install.sh libjpeg-progs
RUN /docker-apt-get-install.sh djvulibre-bin
RUN /docker-apt-get-install.sh fonts-hosny-amiri \
      fonts-farsiweb \
      fonts-nafees \
      fonts-arphic-uming \
      fonts-arphic-ukai \
      fonts-baekmuk \
      fonts-texgyre \
      fonts-gfs-baskerville \
      fonts-gfs-porson \
      fonts-ipaexfont-gothic \
      fonts-ipaexfont-mincho \
      fonts-ipafont-gothic \
      fonts-cabin \
      fonts-comfortaa \
      fonts-crosextra-caladea \
      fonts-crosextra-carlito \
      fonts-dejavu-extra \
      fonts-ebgaramond \
      fonts-ebgaramond-extra \
      fonts-font-awesome \
      fonts-freefont-otf \
      fonts-freefont-ttf \
      fonts-gfs-artemisia \
      fonts-gfs-complutum \
      fonts-gfs-didot \
      fonts-gfs-neohellenic \
      fonts-gfs-olga \
      fonts-gfs-solomos \
      fonts-inconsolata \
      fonts-junicode \
      fonts-lato \
      fonts-linuxlibertine \
      fonts-lobster \
      fonts-lobstertwo \
      fonts-oflb-asana-math \
      fonts-sil-gentium \
      fonts-sil-gentium-basic \
      fonts-stix
RUN /docker-apt-get-install.sh ttf-adf-accanthis
RUN /docker-apt-get-install.sh ttf-adf-gillius
RUN /docker-apt-get-install.sh ttf-adf-universalis
RUN /docker-apt-get-install.sh x11-xserver-utils
RUN /docker-apt-get-install.sh x11-utils
RUN /docker-apt-get-install.sh tk
RUN /docker-apt-get-install.sh xdg-utils
RUN /docker-apt-get-install.sh ruby
RUN /docker-apt-get-install.sh ps2eps
RUN /docker-apt-get-install.sh tex-gyre
RUN /docker-apt-get-install.sh texlive-base
RUN /docker-apt-get-install.sh texlive-font-utils
RUN /docker-apt-get-install.sh texlive-fonts-recommended
RUN /docker-apt-get-install.sh texlive-generic-recommended
RUN /docker-apt-get-install.sh texlive-latex-recommended
RUN /docker-apt-get-install.sh texlive-latex-extra
RUN /docker-apt-get-install.sh texlive-fonts-extra
RUN /docker-apt-get-install.sh texlive-xetex
RUN /docker-apt-get-install.sh texlive-generic-extra
RUN /docker-apt-get-install.sh latex-cjk-common
RUN /docker-apt-get-install.sh latex-cjk-chinese
RUN /docker-apt-get-install.sh latex-cjk-japanese
RUN /docker-apt-get-install.sh latex-cjk-korean
RUN /docker-apt-get-install.sh texlive-lang-african
RUN /docker-apt-get-install.sh texlive-lang-arabic
RUN /docker-apt-get-install.sh texlive-lang-cyrillic
RUN /docker-apt-get-install.sh texlive-lang-czechslovak
RUN /docker-apt-get-install.sh texlive-lang-english
RUN /docker-apt-get-install.sh texlive-lang-european
RUN /docker-apt-get-install.sh texlive-lang-french
RUN /docker-apt-get-install.sh texlive-lang-german
RUN /docker-apt-get-install.sh texlive-lang-greek
RUN /docker-apt-get-install.sh texlive-lang-indic
RUN /docker-apt-get-install.sh texlive-lang-italian
RUN /docker-apt-get-install.sh texlive-lang-polish
RUN /docker-apt-get-install.sh texlive-lang-portuguese
RUN /docker-apt-get-install.sh texlive-lang-spanish
RUN /docker-apt-get-install.sh texlive-lang-all
RUN /docker-apt-get-install.sh latex-xcolor

RUN /docker-apt-get-install.sh \
    at-spi2-core \
    camlp4 \
    colord \
    colord-data \
    dbus \
    fakeroot \
    latex-cjk-all \
    latex-cjk-chinese-arphic-bkai00mp \
    latex-cjk-chinese-arphic-bsmi00lp \
    latex-cjk-chinese-arphic-gbsn00lp \
    latex-cjk-chinese-arphic-gkai00mp \
    latex-cjk-japanese-wadalab \
    latex-cjk-thai \
    ledit \
    libalgorithm-diff-perl \
    libalgorithm-diff-xs-perl \
    libalgorithm-merge-perl \
    libaudio2:amd64 \
    libauthen-sasl-perl \
    libcolorhug2:amd64 \
    libdrm-intel1:amd64 \
    libdrm-nouveau2:amd64 \
    libdrm-radeon1:amd64 \
    libencode-locale-perl \
    libfakeroot:amd64 \
    libfile-basedir-perl \
    libfile-copy-recursive-perl \
    libfile-desktopentry-perl \
    libfile-fcntllock-perl \
    libfile-homedir-perl \
    libfile-listing-perl \
    libfile-mimeinfo-perl \
    libfile-which-perl \
    libfont-afm-perl \
    libgl1-mesa-dri:amd64 \
    libgphoto2-6:amd64 \
    libgphoto2-l10n \
    libgraphicsmagick++3 \
    libgudev-1.0-0:amd64 \
    libgusb2:amd64 \
    libhtml-form-perl \
    libhtml-format-perl \
    libhtml-parser-perl \
    libhtml-tagset-perl \
    libhtml-tree-perl \
    libhttp-cookies-perl \
    libhttp-daemon-perl \
    libhttp-date-perl \
    libhttp-message-perl \
    libhttp-negotiate-perl \
    libieee1284-3:amd64 \
    libio-html-perl \
    libio-socket-ssl-perl \
    liblwp-mediatypes-perl \
    liblwp-protocol-https-perl \
    libmailtools-perl \
    libmng1:amd64 \
    libnet-dbus-perl \
    libnet-http-perl \
    libnet-smtp-ssl-perl \
    libnet-ssleay-perl \
    libpam-systemd:amd64 \
    libpciaccess0:amd64 \
    libpolkit-agent-1-0:amd64 \
    libpolkit-backend-1-0:amd64 \
    libpolkit-gobject-1-0:amd64 \
    libpoppler-qt4-4:amd64 \
    libqt4-xml:amd64 \
    libqtcore4:amd64 \
    libqtgui4:amd64 \
    libsane:amd64 \
    libsane-common \
    libsane-extras:amd64 \
    libsane-extras-common \
    libtie-ixhash-perl \
    libtxc-dxtn-s2tc0:amd64 \
    liburi-perl \
    libusb-1.0-0:amd64 \
    libutempter0 \
    libv4l-0:amd64 \
    libv4lconvert0:amd64 \
    libwww-perl \
    libwww-robotrules-perl \
    libx11-protocol-perl \
    libxml-parser-perl \
    libxml-twig-perl \
    libxml-xpathengine-perl \
    libyaml-tiny-perl \
    lmodern \
    pdf2djvu \
    policykit-1 \
    prerex \
    prosper \
    qtcore4-l10n \
    sane-utils \
    swath \
    texlive-extra-utils \
    texlive-pstricks \
    update-inetd \
    vprerex \
    xbitmaps \
    xterm

RUN useradd -r -m -d /var/lib/ocg ocg

ADD ./docker-npm-install.sh /docker-npm-install.sh

ADD mw-ocg-service/ /var/lib/ocg/mw-ocg-service/
WORKDIR /var/lib/ocg/mw-ocg-service/
RUN /docker-npm-install.sh --only=prod

ADD mw-ocg-bundler/ /var/lib/ocg/mw-ocg-bundler/
WORKDIR /var/lib/ocg/mw-ocg-bundler/
RUN /docker-npm-install.sh --only=prod

ADD mw-ocg-texter/ /var/lib/ocg/mw-ocg-texter/
WORKDIR /var/lib/ocg/mw-ocg-texter/
RUN /docker-npm-install.sh --only=prod

ADD mw-ocg-latexer/ /var/lib/ocg/mw-ocg-latexer/
WORKDIR /var/lib/ocg/mw-ocg-latexer/
RUN /docker-npm-install.sh --only=prod

ADD ./localsettings.js /var/lib/ocg/mw-ocg-service/

ADD ./run.sh /root/
RUN chmod +x /root/run.sh

CMD ["/root/run.sh"]
