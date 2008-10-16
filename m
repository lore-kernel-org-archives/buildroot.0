From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Oct 2008 23:47:00 +0200
Subject: [Buildroot] [PATCH 2/9] Fix link flags of mtdutils
In-Reply-To: <20081016233829.1d5efba4@surf>
References: <20081016203220.15826.26173.stgit@localhost.localdomain>
	<20081016203225.15826.71097.stgit@localhost.localdomain>
	<20081016225130.491d128c@surf>
	<BD79186B4FD85F4B8E60E381CAEE1909B55B74@mi8nycmail19.Mi8.com>
	<20081016233829.1d5efba4@surf>
Message-ID: <20081016234700.04fdf081@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 16 Oct 2008 23:38:29 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> TARGET_CONFIGURE_OPTS is supposed to be used in all packages when
> calling ./configure, as far as I understand (and it's the case in the
> packages I had a look at). TARGET_CONFIGURE_OPTS is of course also
> used by Makefile.autotools.in.

Ok, my bad. The mtd package doesn't have a ./configure script, so it
doesn't use TARGET_CONFIGURE_OPTS, so obviously, it should be fixed in
a different way.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
