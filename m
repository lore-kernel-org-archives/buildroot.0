From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Aug 2012 19:43:10 +0200
Subject: [Buildroot] Best way of building for unknown architecture
In-Reply-To: <760828.46392.bm@smtp116.mail.ukl.yahoo.com>
References: <760828.46392.bm@smtp116.mail.ukl.yahoo.com>
Message-ID: <20120817194310.25198340@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 17 Aug 2012 18:39:55 +0100,
Kevin Chadwick <ma1l1ists@yahoo.co.uk> a ?crit :

> 	Openembedded, T2 and NuttX seem to support arm7-m (cortex-m3)
> 	but I like buildroot. Is the best way of building to use Little
> 	endian generic and the GCC compiler or is it fairly easy to add
> 	a new architecture variant that I could possibly send a diff
> 	for later.

Adding a new target architecture variant just requires a few lines of
code in target/Config.in.arch. If you give some hints, I'm pretty sure
someone will be kind enough to help you making the necessary changes.

> 	Similarly is it easier to use the kernel patch config and kernel
> 	config options or is it fairly easy to add a Target
> 	architecture.

In 'make menuconfig', Kernel submenu, there is an option to point to
kernel patches needed for your platform.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
