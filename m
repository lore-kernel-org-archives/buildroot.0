From: Christian Stewart <christian@paral.in>
Date: Sun, 01 May 2016 04:03:34 +0000
Subject: [Buildroot] Support libseccomp on ARM
Message-ID: <1462075414806-5f3481c2-47606400-05714d32@mixmax.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,
Is there any chance we can get libseccomp running under ARM? Right now it has
the following requirements:

Depends on: (BR2_aarch64 [=n] || BR2_mips [=n] || BR2_mipsel [=n] || BR2_mips64
[=n] || BR2_mips64el [=n] || BR2_i386 [=n] || BR2_x86_64 [=n]) &&
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 [=y]
Does it potentially work under ARM, and if so, can we add it to the list of
requirement satisfiers? If not, what is required to get it working there?

I found this: https://lwn.net/Articles/522645/
It mentions that the patch depends on the linux-next patch ?seccomp: Make
syscall skipping and nr changes more consistent? which I hope isn't the case.
Thanks! Christian Stewart
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160501/bf162fe7/attachment.html>
