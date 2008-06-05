From: N Cheung <brjerome.1@gmail.com>
Date: Wed, 4 Jun 2008 22:02:53 -0700
Subject: [Buildroot] merger kernel u-boot and root fs sources into buildroot
Message-ID: <c260b4940806042202o16373ebmb22a536645a3f0b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a running ARM kernel 2.6.25 on Atmel's 9260ek  with u-boot
1.3.2 and root fs (cramfs) all built by using make individually.  The
kernel build included 2 simple device drivers. I use busybox and
glibc.

I would like to try BR.  This might be a naive question, how do I
merge in my source tree with BR, is it just copy?  Is BR uclibc
specific?

Thanks,
Noman
