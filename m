From: sonntex <sonntex@gmail.com>
Date: Sat, 30 Apr 2016 20:16:35 +0300
Subject: [Buildroot] Can not boot sdcard.img for raspberry pi 2
Message-ID: <CAPeTicN2Ov=iSNMxwJ85xYABtsJNubVADU4sYq7jBhw6Fp-jkg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I checkouted to the latest master commit with hash
70fc85f969c6aee7253d4098a70946e5b16eed4b and trying to build image for
raspberry pi 2.

make raspberrypi2_defconfig
make
dd if=output/images/sdcard.img of=/dev/sdb

The image is not booted. Is it a bug? Can I correct it? I tryed to use two
different hosts: debian jessie and gentoo.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160430/fc892b4a/attachment.html>
