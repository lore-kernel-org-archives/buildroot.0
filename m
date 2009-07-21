From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Jul 2009 23:54:34 +0200
Subject: [Buildroot] clean build
In-Reply-To: <206b9e70907211115j3a90364bl1d1d8c960ba4cddf@mail.gmail.com>
References: <59693.172.16.221.250.1247692614.squirrel@cvs.xtale.biz>
	<206b9e70907211115j3a90364bl1d1d8c960ba4cddf@mail.gmail.com>
Message-ID: <20090721235434.565c5951@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 21 Jul 2009 11:15:22 -0700,
Zac Wheeler <zac.wheeler@gmail.com> a ?crit :

> I believe this is in the documentation, but if you create a directory
> in buildroot called e.g. permanent_downloads and make dl/ a symoblic
> link to that directory, you avoid having to re-download source
> packages.

Or alternatively, you create a directory outside of the Buildroot tree
and set the BUILDROOT_DL_DIR environment variable so that it points to
this directory. Then all Buildroot executions, even after a global
clean, will not re-download the packages.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
