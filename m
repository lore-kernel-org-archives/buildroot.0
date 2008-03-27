From: Arndt Kritzner <kritzner@logicway.de>
Date: Thu, 27 Mar 2008 09:40:52 +0100
Subject: [Buildroot] avr32 Problem in toolchain build
Message-ID: <47EB5D94.4070006@logicway.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building the snapshots 20080325 or 20080327 with "make
atstk1002_defconfig; make" bails out in building the (bootstrap?)
compiler. In 20080320 this problem didn't occur.

"make" output:
creating ./config.status
creating Makefile
touch
/media/usb-hdd/buildroot.20080325.2/toolchain_build_avr32/gcc-4.2.1-initial/.configured
PATH="/media/usb-hdd/buildroot.20080325.2/toolchain_build_avr32/bin:/media/usb-hdd/buildroot.20080325.2/build_avr32/staging_dir/bin:/media/usb-hdd/buildroot.20080325.2/build_avr32/staging_dir/usr/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/X11R6/bin:/opt/bin:/opt/gnome/bin:/opt/java/bin:/opt/java/jre/bin:/opt/kde/bin:/opt/mozilla/bin:/opt/qt/bin"
/usr/bin/make -j1 -C
/media/usb-hdd/buildroot.20080325.2/toolchain_build_avr32/gcc-4.2.1-initial
all-gcc
make[1]: Entering directory
`/media/usb-hdd/buildroot.20080325.2/toolchain_build_avr32/gcc-4.2.1-initial'
mkdir -p -- ./intl
Configuring in ./intl
configure: creating cache ./config.cache
checking whether make sets $(MAKE)... yes
checking for a BSD-compatible install... /bin/install -c
checking whether NLS is requested... no
checking for msgfmt... /usr/bin/msgfmt
checking for gmsgfmt... /usr/bin/msgfmt
checking for xgettext... /usr/bin/xgettext
...
checking whether setrlimit is declared... yes
checking whether getrusage is declared... yes
checking whether ldgetname is declared... no
checking whether times is declared... yes
checking whether sigaltstack is declared... yes
checking for struct tms... yes
checking for clock_t... yes
checking for .preinit_array/.init_array/.fini_array support... yes
checking if mkdir takes one argument... no
*** Configuration avr32-unknown-linux-uclibc not supported
make[1]: *** [configure-gcc] Fehler 1
make[1]: Leaving directory
`/media/usb-hdd/buildroot.20080325.2/toolchain_build_avr32/gcc-4.2.1-initial'
make: ***
[/media/usb-hdd/buildroot.20080325.2/toolchain_build_avr32/gcc-4.2.1-initial/.compiled]
Fehler 2

-- 

--
###############################################################
Dipl. Ing Arndt Kritzner    Tel:    (0385) 3993 448
Logic Way GmbH              Fax:    (0385) 3993 458
Hagenower Strasse 73        HTTP:   http://www.logicway.de
19061 Schwerin              email:  mailto:kritzner at logicway.de
###############################################################
