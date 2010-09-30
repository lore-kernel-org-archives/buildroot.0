From: Dennis Borgmann <dennis.borgmann@googlemail.com>
Date: Thu, 30 Sep 2010 13:23:46 +0200
Subject: [Buildroot] CONFIG_BLK_DEV_INITRD deactivated on automatic build
Message-ID: <4CA47342.7020405@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello buildroot-list!

First of all - thank you for the work done for this project. It is
awesome and I really like it. Straightforward and quick to use.

I think, I found a bug. If you download buildroot and start configuring
your project with "make menuconfig" and after that configure the kernel
with "make linux26-menuconfig", everything seems to be ok. I did give it
a custom kernel-config named "/tmp/config-2.6.34".

After running "make", everything seems to be ok, but the resulting
kernel does not contain the option "CONFIG_BLK_DEV_INITRD". I need to
manually do a "make linux26-menuconfig" again and rebuild the kernel for
the resulting kernel to contain this option.

This was a really silly thing to find, took me around one week, because
you wouldn't think of such a mistake. Could it be, that this is a bug? I
am using buildroot-2010.08.

Kind regards,
Dennis
