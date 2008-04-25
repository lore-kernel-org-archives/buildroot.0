From: John Voltz <john.voltz@gmail.com>
Date: Fri, 25 Apr 2008 15:18:51 -0400
Subject: [Buildroot] pkgconfig filter
Message-ID: <46a136670804251218s4506ddb3r5bf9bde4bfede751@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've noticed that some of the packages are slipping past the pkgconfig
filter script and instead going straight to using the host pkgconfig. This
is preventing the PKG_CONFIG_SYSROOT from getting prepended to the
variables. I'm working on fixing it, but in the mean time, beware if you
build for x86.


John
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080425/5dbf2b81/attachment.htm 
