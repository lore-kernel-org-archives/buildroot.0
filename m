From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu, 12 Jan 2012 00:32:35 +0100
Subject: [Buildroot] Error installing  udev  : frugalware ??
Message-ID: <DBC7AF7422C5458EB0B788B267A834FC@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

Using 2011.11 :

udev seems to build, but the install fails.

There seems to be no  ?(TOPDIR)/output/build/udev-173/etc/udev/frugalware/*

In my configfile I have

BR2_PACKAGE_UDEV=y
# BR2_PACKAGE_UDEV_ALL_EXTRAS is not set

Error :

Snip ...
mkdir -p /home/johan/buildroot/output/target/etc/udev/rules.d
mkdir -p /home/johan/buildroot/output/target/lib/udev/devices
Making install in libudev/docs
make[4]: Nothing to be done for `install-exec-am'.
-- Installing ./html/api-index-full.html
-- Installing ./html/ch01.html
-- Installing ./html/home.png
-- Installing ./html/index.html
-- Installing ./html/index.sgml
-- Installing ./html/left.png
-- Installing ./html/libudev.devhelp
-- Installing ./html/libudev.devhelp2
-- Installing ./html/libudev-udev-device.html
-- Installing ./html/libudev-udev-enumerate.html
-- Installing ./html/libudev-udev.html
-- Installing ./html/libudev-udev-list.html
-- Installing ./html/libudev-udev-monitor.html
-- Installing ./html/libudev-udev-queue.html
-- Installing ./html/right.png
-- Installing ./html/style.css
-- Installing ./html/up.png
make[1]: Leaving directory `/home/johan/buildroot-2011.11js/output/build/udev-173'
/usr/bin/install -m 0755 package/udev/S10udev /home/johan/buildroot/output/target/etc/init.d
/usr/bin/install -m 0644 /home/johan/buildroot/output/build/udev-173/etc/udev/frugalware/*
/home/johan/buildroot/output/target/etc/udev/rules.d
/usr/bin/install: cannot stat `/home/johan/buildroot/output/build/udev-173/etc/udev/frugalware/*': No such file or directory
make: *** [/home/johan/buildroot/output/build/udev-173/.stamp_target_installed] Error 1

?
Sagaert Johan
