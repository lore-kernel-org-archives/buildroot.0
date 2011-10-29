From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2011 08:23:00 +0200
Subject: [Buildroot] [git commit] crosstool-ng: fix ccache dependencies
 order
In-Reply-To: <20111028124451.0B18C8F35A@busybox.osuosl.org>
References: <20111028124451.0B18C8F35A@busybox.osuosl.org>
Message-ID: <20111029082300.5c4086df@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 28 Oct 2011 14:41:26 +0200,
Peter Korsgaard <jacmet@sunsite.dk> a ?crit :

> avoid gawk complaining

about what ?

> when running 'make ctng-menuconfig' in a
> clean/distclean tree in which ccache and crosstool-ng are enabled

This sounds like a workaround. The ordering of dependencies inside a
_DEPENDENCIES variable shouldn't matter. Isn't it a missing dependency
somewhere else ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
