From: User Name <us53rnam3@gmail.com>
Date: Tue, 4 Aug 2020 15:31:17 -0400
Subject: [Buildroot] I need help to solve this error.
Message-ID: <CA+NfSnKEWD+cdgUA85raKk3pRcC2kMauh1BQQLTv38g=thdhWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

root at debian:/home/jemwarodrierk/Bureau/buildroot/linux_vita# make ARCH=arm
CROSS_COMPILE=arm-linux- -j
make: arm-linux-gcc: Command not found
scripts/kconfig/conf  --syncconfig Kconfig
scripts/Kconfig.include:39: compiler 'arm-linux-gcc' not found
make[2]: *** [scripts/kconfig/Makefile:75: syncconfig] Error 1
make[1]: *** [Makefile:568: syncconfig] Error 2
make: *** [Makefile:678: include/config/auto.conf.cmd] Error 2
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200804/90ce53a3/attachment.html>
