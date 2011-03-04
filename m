From: bruce bushby <bruce.bushby@gmail.com>
Date: Fri, 4 Mar 2011 21:15:30 +0000
Subject: [Buildroot] Applying custom kernel patches
Message-ID: <AANLkTi=_dHFneTLXe3+P1-cOM2dsLsQW6f_fgbK7hSQy@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I'm having some trouble applying kernel patches.

I manually copied the kernel tar ball
into: /opt/buildroot/dl/linux-2.6.38-rc5.tar.bz2 and using "make menuconfig"
I specified the kernel version


.....however I'm having some problems applying my patches. Everything
compiles 100% if I patch "/opt/buildroot/output/toolchain/linux-2.6.38-rc5",
however I would
like it to apply my patches after extracting the tar ball from
"/opt/buildroot/dl/linux-2.6.38-rc5.tar.bz2" when I run "make"

I've tried placing my patches in:
/opt/buildroot/linux/kernel-patches/0001-linux-2.6.38-rc5.patch

I also tried putting them in
/opt/buildroot/package/linux/kernel-patches/0001-linux-2.6.38-rc5.patch

Using "make menuconfig" under specified custom patches I added:
linux/kernel-patches/0001-linux-2.6.38-rc5.patch

...but it won't apply the patch.

Any ideas?


Thanks
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110304/e872e8c9/attachment.html>
