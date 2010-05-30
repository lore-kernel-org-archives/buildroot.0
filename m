From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 May 2010 12:36:55 +0200
Subject: [Buildroot] Package conversion for 2010.08
Message-ID: <20100530123655.6cffcc8c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Release 2010.05 will soon be released by Peter and therefore I'd like
to make a new status of the package conversion effort. For the record,
the previous status of this effort was given on March, 14th:

 http://lists.busybox.net/pipermail/buildroot/2010-March/032840.html

At that time, we had 61 packages to convert to the generic package
infrastructure, and 107 to convert to the autotools infrastructure.

As of today's Git version, we are now at 56 packages to convert to the
generic package infrastructure and 77 packages to convert to the
autotools infrastructure.

Your help would be very appreciated in speeding up this conversion
effort. Before doing any conversion, check our Bugzilla to see if
someone else has already done the conversion work for your package.

Packages to convert to the autotools infrastructure
===================================================

 * alsa-utils
 * axel
 * bash
 * berkeleydb
 * boa
 * coreutils
 * cups
 * cvs
 * dash
 * dhcp
 * dhcpdump
 * dialog
 * diffutils
 * dillo
 * distcc
 * dmalloc
 * fbv
 * file
 * gawk
 * gettext
 * gmp
 * gtk2-engines
 * gzip
 * hal
 * icu
 * imagemagick
 * iproute2
 * ipsec-tools
 * libeXosip2
 * libfuse
 * libglib12
 * libgpg-error
 * libgtk12
 * liblockfile
 * links
 * lrzsz
 * ltrace
 * lvm2
 * madplay
 * make
 * module-init-tools
 * modutils
 * mpfr
 * mpg123
 * mplayer
 * netkitbase
 * netkittelnet
 * netsnmp
 * newt
 * nfs-utils
 * ntp
 * pciutils
 * pptp-linux
 * prboom
 * proftpd
 * python
 * qt
 * quagga
 * rp-pppoe
 * ruby
 * rxvt
 * sdl
 * sdl_mixer
 * sdl_ttf
 * sed
 * socat
 * stunnel
 * sudo
 * tftpd
 * thttpd
 * tn5250
 * util-linux
 * valgrind
 * vim
 * xerces
 * xfsprogs
 * zlib

Packages to convert to the generic infrastructure
=================================================

 * acpid
 * bsdiff
 * busybox
 * concierge
 * devmem2
 * doom-wads
 * dosfstools
 * ezxml
 * fbset
 * fconfig
 * festival
 * festlex
 * festvox
 * fis
 * gadgetfs-test
 * hdparm
 * hotplug
 * hwdata
 * input-tools
 * iostat
 * l2tp
 * liberation
 * libfloat
 * lmbench
 * lm-sensors
 * lockfile-progs
 * logrotate
 * lsof
 * ltp-testsuite
 * makedevs
 * matchbox
 * mcookie
 * memtester
 * microcom
 * microperl
 * microwin
 * mii-diag
 * mrouted
 * netplug
 * pcmcia
 * portage
 * portmap
 * procps
 * sfdisk
 * slang
 * sysklogd
 * sysvinit
 * tinyhttpd
 * ttcp
 * uemacs
 * usbmount
 * vpnc
 * vsftpd
 * webif
 * wipe
 * wireless-tools

Thomas Petazzoni
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
