From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2009 09:30:08 +0100
Subject: [Buildroot] Building a usable ImageMagick
In-Reply-To: <20091104092438.29d3c3cf@surf>
References: <20091104072640.GC10219@jasper.tkos.co.il>
	<20091104092438.29d3c3cf@surf>
Message-ID: <20091104093008.5e4b3e78@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 4 Nov 2009 09:24:38 +0100,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> .la files really aren't meant to be used at run time, so I would
> suggest to fix ImageMagick. Why don't they use the .so files to get
> the list of available modules ?

We're not the only ones having the issue it seems:
 http://src.opensolaris.org/source/xref/sfw/usr/src/cmd/ImageMagick/la.patch
 http://src.opensolaris.org/source/xref/jds/spec-files/branches/opensolaris-2008-05/patches/imagemagick-01-ltdl.diff

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
