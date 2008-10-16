From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Oct 2008 22:51:30 +0200
Subject: [Buildroot] [PATCH 2/9] Fix link flags of mtdutils
In-Reply-To: <20081016203225.15826.71097.stgit@localhost.localdomain>
References: <20081016203220.15826.26173.stgit@localhost.localdomain>
	<20081016203225.15826.71097.stgit@localhost.localdomain>
Message-ID: <20081016225130.491d128c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 16 Oct 2008 14:32:25 -0600,
Grant Likely <grant.likely@secretlab.ca> a ?crit :

> The mtd makefile fragment doesn't specify LDFLAGS.  This can cause the
> linking to fail when trying to find libz if using an external
> toolchain

This is a problem I also face with many other packages (libpng,
directfb, etc.). So I've proposed another, more radical patch:

http://buildroot.uclibc.org/lists/buildroot/2008-October/011017.html

Sadly, I didn't get any feedback about it.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
