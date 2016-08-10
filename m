From: Chetan Kumar <shivakumar.chetan@gmail.com>
Date: Wed, 10 Aug 2016 15:57:48 +0100
Subject: [Buildroot] eudev compilation fails on buildroot-2016.08-rc1
Message-ID: <CAFN-Ez51T+Z-3t_15sWgPDgrvRYRyW6raiDvbC744cgVcqiJ8w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am trying to build eudev on buildroot-2016.08-rc1, it fails at below

checking for gawk... (cached) mawk
checking for
/home/buildroot-2016.08-rc1/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
option to accept ISO C99... unsupported
configure: error: no C99 compiler found, eudev requires a C99 compiler.
make[1]: ***
[/home//buildroot-2016.08-rc1/output/build/eudev-3.2/.stamp_configured]
Error 1
make: *** [_all] Error 2


Any help ?

Thanks
C
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160810/fb666154/attachment.html>
