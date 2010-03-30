From: Sasha Sirotkin <buildroot@browserseal.com>
Date: Tue, 30 Mar 2010 15:27:01 +0300
Subject: [Buildroot] init segfaults when compiled with glibc
Message-ID: <4BB1EE15.6000505@browserseal.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I compiled an external toolchain with glibc support using crosstools-ng 
as recommended. I managed to compile buildroot without any issues. 
However, when I try to use the resulting image /sbin/init segfaults. 
With uclibc there are no such issues. I'm using the latest versions of 
everything on ARM with EABI.

Any suggestions ?
