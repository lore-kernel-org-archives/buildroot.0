From: Daniel Kuhne <daniel.kuhne@yahoo.de>
Date: Tue, 15 Mar 2011 10:44:11 +0000 (GMT)
Subject: [Buildroot] Facing errors when building swfdec (using external
	toolchain)
Message-ID: <910338.67295.qm@web29006.mail.ird.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
buildroot team,

?

Building
swfdec using external toolchain results in erros. I did not modify the
swfdec.mk file.

I use
buildroot-2011.02 but same problem on 2010.11

?

Toolchain
located in /usr/local/arm/4.2.2-eabi

libstdc++
located in:

?

buildroot-2011.02/output/staging/usr/arm-unknown-linux-gnueabi/lib/libstdc++.so.6.0.9

buildroot-2011.02/output/staging/usr/arm-unknown-linux-gnueabi/lib/libstdc++.la

buildroot-2011.02/output/staging/usr/arm-unknown-linux-gnueabi/lib/libstdc++.so.6

buildroot-2011.02/output/staging/usr/arm-unknown-linux-gnueabi/lib/libstdc++.a

buildroot-2011.02/output/staging/usr/arm-unknown-linux-gnueabi/lib/libstdc++.so

buildroot-2011.02/output/staging/usr/arm-samsung-linux-gnueabi/lib/libstdc++.so.6.0.9

buildroot-2011.02/output/staging/usr/arm-samsung-linux-gnueabi/lib/libstdc++.la

buildroot-2011.02/output/staging/usr/arm-samsung-linux-gnueabi/lib/libstdc++.so.6

buildroot-2011.02/output/staging/usr/arm-samsung-linux-gnueabi/lib/libstdc++.a

buildroot-2011.02/output/staging/usr/arm-samsung-linux-gnueabi/lib/libstdc++.so

?

please see
errors here: http://pastebin.com/Bp7KJKT3

?

Something
with the path is happening:

/bin/grep:
/Daten/buildroot-picocom4/buildroot-2011.02/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/local/arm/4.2.2-eabi/usr/bin-ccache/../lib/gcc/arm-unknown-linux-gnueabi/4.2.2/../../../../arm-unknown-linux-gnueabi/lib/libstdc++.la:
No such file or directory

?

Best
regards,

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110315/f3aa886d/attachment.html>
