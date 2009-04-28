From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Apr 2009 18:40:43 +0200
Subject: [Buildroot] gdb snapshot
In-Reply-To: <1240935848.19264.2.camel@sven>
References: <1240935848.19264.2.camel@sven>
Message-ID: <20090428184043.3e10c50a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 28 Apr 2009 18:24:08 +0200,
Sven Neumann <s.neumann@raumfeld.com> a ?crit :

> as I am having problems with gdb 6.8 on our ARM platform, I thought
> I'd give the gdb snapshot a try and selected it in the buildroot
> menu. But this fails as the patches in toolchain/gdb/snapshot seem to
> be targetted at a particular snapshot (gdb-6.3.50.20050915). Does
> this work for anyone else? Can this possibly work?

Maybe instead of using the the gdb.tar.bz2 symbolic link, we could
refer to a precise version of the gdb snapshot, so that the patches
have a chance to work.

The patches in snapshot/ haven't been updated since 2006, so I would
say that this part is unmaintained, which means that nobody uses it and
we can probably drop it.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
