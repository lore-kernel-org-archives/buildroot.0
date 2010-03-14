From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Mar 2010 17:11:34 +0100
Subject: [Buildroot] Package conversion effort for 2010.05
Message-ID: <20100314171134.53dd3b7e@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

For the next release, due in may 2010, it'd be great if we could
convert most (if not all) of our packages to either the autotools
infrastructure or the generic infrastructure. Your help in this effort
would be very appreciated.

Details on how to convert packages is available in the Buildroot
documentation: http://buildroot.org/downloads/buildroot.html.

I'm giving below the current status, i.e which packages require
conversion, if patches are already available or not, etc. Do not
hesitate to pick one or several of the following packages, and tell us
about your intention to work on them.

I will regularly send a status of this conversion effort.

Thanks for your contributions!

Current status
==============

 * 61 packages should be converted to the generic infrastructure
 * 107 packages should be converted to the autotools infrastructure

Packages to convert to the generic infrastructure
=================================================

 * microcom
 * vpnc
 * microwin [ deprecate ? ]
 * linux-fusion
 * hotplug [ deprecate ? ]
 * portmap
 * logrotate
 * slang
 * java/concierge
 * acpid
 * mdadm
 * ttcp
 * hdparm
 * fconfig
 * input-tools
 * editors/uemacs
 * games/doom-wad
 * lua
 * sysklogd
 * portage
 * mii-diag
 * iostat
 * lm-sensors
 * vsftpd
 * bsdiff
 * multimedia/festival/lexicons/festlex
 * multimedia/festival/voices/festvox
 * multimedia/festival
 * usbmount
 * fis
 * sysvinit
 * libfloat
 * gadgetfs-test
 * tinyhttpd
 * procps
 * lsof
 * sdfisk
 * hwdata
 * ezxml
 * pcmcia
 * memtester
 * lockfile-progs
 * memstat [ done by https://bugs.busybox.net/show_bug.cgi?id=1129 ]
 * wireless-tools
 * initramfs
 * busybox
 * libaio
 * netplug
 * eeprog
 * liberation
 * dosfstools
 * webif
 * libxslt
 * microperl
 * wipe
 * fbset
 * x11r7/mesa3d
 * x11r7/mcookie

Packages to convert to the autotools infrastructure
===================================================

 * ruby
 * dhcp
 * ncurses
 * gmp
 * python
 * vtun
 * libdrm
 * pciutils
 * module-init-tools
 * tn5250
 * rp-pppoe
 * netkitbase
 * dmalloc
 * libosip2
 * gtk2-engines
 * hal
 * iproute2
 * netkittelnet
 * thttpd
 * pptp-linux
 * axel
 * pppd
 * grep
 * matchbox
 * libcgi
 * netsnmp
 * less [ done by https://bugs.busybox.net/show_bug.cgi?id=1123 ]
 * stunnel
 * gzip
 * nano [ done by https://bugs.busybox.net/show_bug.cgi?id=1117 ]
 * editors/vim
 * games/prboom
 * libeXosip2
 * qt [ not autotools-based ]
 * cups
 * imagemagick
 * socat
 * ntp
 * libglib12 [ deprecate ? ]
 * icu
 * mpfr
 * dummy
 * multimedia/libid3tag
 * multimedia/aumix
 * multimedia/madplay
 * multimedia/libmad
 * multimedia/mpg123
 * multimedia/alsa-utils
 * multimedia/mplayer
 * findutils
 * proftpd
 * cvs
 * dialog
 * argus
 * libgtk12 [ deprecate ? ]
 * gettext
 * dhcpdump
 * sed
 * dash
 * make
 * zlib
 * dillo
 * sdl
 * xerces
 * gawk
 * sdl_mixer
 * boa
 * quagga
 * liblockfile
 * wget [ done by https://bugs.busybox.net/show_bug.cgi?id=1111 ]
 * bison
 * tar
 * links
 * setserial
 * libcgicc
 * libgcrypt
 * file
 * libusb
 * xfsprogs
 * libfuse
 * coreutils
 * diffutils
 * ipsec-tools
 * smartmontools
 * fbv
 * udpcast
 * patch
 * tftpd
 * libraw1394
 * mutt
 * lvm2
 * lrzsz
 * libsysfs
 * rxvt
 * distcc
 * valgrind
 * modutils [ deprecate ? ]
 * x11r7/xapp_xman
 * x11r7/xdata_xcursor-themes
 * ltrace
 * newt
 * berkeleydb

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
