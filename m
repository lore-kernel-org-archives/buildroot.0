From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Oct 2013 16:42:27 +0200
Subject: [Buildroot] Buildroot patchwork: decision on the 10 oldest patches,
	week 1
Message-ID: <20131006164227.0ab2a172@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The oldest patches in patchwork don't get a lot of attention (or even
any attention at all). I had a discussion this week with Thomas De
Schampheleire, and we would like to progressively clean up the backlog
of patches we have in patchwork, especially the oldest one.

So, every week, I'll be posting the list of the 10 oldest patches, with
the original patch contributors in Cc. During one week, we have the
opportunity to discuss the patch, whether it is still necessary or not,
how it should be changed to be merged.

In particular, I'm interested in knowing if the original contributor is
still interested by the patch, or if someone else is interested in
adopting the patch and sending an updated version, or if the patch no
longer makes sense due to other changes made in Buildroot.

All patches that have not received any comment or attention within the
week will be removed from patchwork. This is aggressive, but we have
patches sitting in patchwork since one year and half, and this cannot
work.

So, for this first week, the patches are:

 1 New: add lava-test package
   http://patchwork.ozlabs.org/patch/155498/
   ludovic.desroches at atmel.com

 2 [v3] busybox: install S41inetd and inetd.conf if inetd is enabled in busybox.
   http://patchwork.ozlabs.org/patch/164551/
   keguang.zhang at gmail.com

 3 [1/1] ccache: expose control interface via 'make ccache-options'
   http://patchwork.ozlabs.org/patch/165382/
   roylee17 at gmail.com

 4 [V2] p910nd: Add p910nd lightweight printserver
   http://patchwork.ozlabs.org/patch/165542/
   david.c.purdy at gmail.com

 5 Added package v86d which provides a real-mode helper for uvesafb driver.
   http://patchwork.ozlabs.org/patch/171840/
   golubovsky at gmail.com

 6 grub: fix stage2 link with recent binutils
   http://patchwork.ozlabs.org/patch/173191/
   net147 at gmail.com

 7 valgrind: valgrind/valgrind.h missing if --disable-tls enabled
   http://patchwork.ozlabs.org/patch/176795/
   stefan.froberg at petroprogram.com

 8 [2/2] rdiff-backup: new package
   http://patchwork.ozlabs.org/patch/176956/
   avishorp at gmail.com

 9 [1/2,v4] package: pkg-generic: Support building override source without copying in common package infrastructure.
   http://patchwork.ozlabs.org/patch/177618/
   sonic.adi at gmail.com

10 grub: add host support
   http://patchwork.ozlabs.org/patch/177705/
   rbraun at sceen.net

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
