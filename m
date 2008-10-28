From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2008 09:50:36 +0100
Subject: [Buildroot] [PATCH] qtopia4: fix use of pkg-config
In-Reply-To: <200810280922.53728.markus.heidelberg@web.de>
References: <200810280251.36628.markus.heidelberg@web.de>
	<20081028081410.5395e6f0@surf>
	<200810280922.53728.markus.heidelberg@web.de>
Message-ID: <20081028095036.7bf735f3@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 28 Oct 2008 09:22:53 +0100,
Markus Heidelberg <markus.heidelberg@web.de> a ?crit :

> Damn, I wanted to keep the comment short without being unclear, which
> apparently failed. This extract from the file Qt/configure should
> make the use of -force-pkg-config and PKG_CONFIG_SYSROOT clear. Qt
> should query PKG_CONFIG_SYSROOT_DIR instead of PKG_CONFIG_SYSROOT.
> I've already sent a bug report.

Ok, now perfectly clear with the code :-) Maybe you can add the
reference of your e-mail in the archives in the comment ? It would keep
the comment short, but still allow one to understand what's going on
exactly.

Thanks a lot for the clarification !

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
