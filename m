From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Aug 2009 21:42:37 +0200
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901BEA43C@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE190901BEA43C@mi8nycmail19.Mi8.com>
Message-ID: <20090819214237.534c433f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 19 Aug 2009 14:32:24 -0400,
"H Hartley Sweeten" <hartleys@visionengravers.com> a ?crit :

> I haven't been able to figure out what the problem is.  Does anyone
> have an idea?  I'm using buildroot version 2009.08-rc2 and kernel
> 2.6.30.5 if that's any help.

Do you compile your kernel with Buildroot, or do you compile it
manually ? If compiled manually, is CONFIG_AEABI enabled in your kernel
configuration ?

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
