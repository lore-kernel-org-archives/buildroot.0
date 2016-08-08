From: Chetan Kumar <shivakumar.chetan@gmail.com>
Date: Mon, 8 Aug 2016 20:12:23 +0100
Subject: [Buildroot] init do not start on rpi-3
Message-ID: <CAFN-Ez6j13by9wX7qiNZhoTdaanzm75UT3MmZ7wCbE0OF+8WDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi List,

I downloaded the latest 2016-05 release, used defconfig_raspberrypi3
created the image. Loaded on to my flash and booted the rpi-3. It just get
stuck at

random: nonblocking pool is initialized

Nothing happens after that, I changed the command line with "init=/bin/sh"
in the cmdline.txt, nothing happens.

Any clue, anyone ?

Thanks
C
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160808/d52a54d7/attachment.html>
