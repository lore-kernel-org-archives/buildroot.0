From: Rainer Berns <rainer.berns@berns-online.de>
Date: Wed, 25 Feb 2015 16:31:41 +0100 (CET)
Subject: [Buildroot] host-libgtk3 fails with buildroot-2015.02-rc3
In-Reply-To: <1424869642-9080-1-git-send-email-gustavo@zacarias.com.ar>
References: <1424869642-9080-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <895368986.18672.1424878301938.JavaMail.open-xchange@oxbsltgw02.schlund.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
 
I tesed buildroot-2015.02-rc3 with my configuration (Cortex A9) from
buildroot-2014.11 and it fails. (Error does occured with rc1)
 
 
>>> host-libgtk3 3.14.5 Building
....
/usr/bin/ld: skipping incompatible
/home/berns/Entwicklung/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libintl.so
when searching for -lintl
/usr/bin/ld: skipping incompatible
/home/berns/Entwicklung/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libintl.a
when searching for -lintl/usr/bin/ld: cannot find -lintl
/usr/bin/ld: cannot find /lib/libpthread.so.0 inside
/usr/bin/ld: cannot find /usr/lib/libpthread_nonshared.a inside
collect2: ld returned 1 exit status
make: ***
[/home/berns/Entwicklung/buildroot-2015.02-rc3/output/build/host-libgtk3-3.14.5/.stamp_built]
Error 1
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150225/45136f10/attachment.html>
