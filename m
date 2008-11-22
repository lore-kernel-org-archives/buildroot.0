From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2008 15:04:30 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package
In-Reply-To: <COL102-DS1115F46E4B6337F6BB1B92DC0C0@phx.gbl>
References: <20081111183231.E74AC3C989@busybox.net>
	<e4c675870811200656l75ad07b8l253459fa0a3e47a6@mail.gmail.com>
	<COL102-DS1115F46E4B6337F6BB1B92DC0C0@phx.gbl>
Message-ID: <20081122150430.1e02b96d@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le Thu, 20 Nov 2008 19:13:31 -0000,
<danieljlaird@hotmail.com> a ?crit :

> Agreed, if someone else does not get there first I will try to apply 
> tomorrow and save you guys.

Could you revert my patch, it is causing too much troubles for existing
users. We must work on a better solution.

> I will then be posting my patch to allow support for using central
> cache file (saves configure time)
> I then may post a patch for people to try that uses sysroot and
> isysroot

That may work, but I have the feeling that the original usage for
--sysroot is to let gcc now where the toolchain is installed (C library
binary and headers, and kernel headers). If you set
--sysroot=$(STAGING_DIR), does gcc still looks in the original
toolchain place for C library headers ?

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
