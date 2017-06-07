From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Wed, 7 Jun 2017 15:10:00 +0000
Subject: [Buildroot] An interesting find.
Message-ID: <F9C551623D2CBB4C9488801D14F864C60154BBD147@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

One of you bigger names should have a look at:

<http://lists.opencompute.org/pipermail/opencompute-onie/2017-May/001409.html>

Reading through this thread makes me think they are considering BuildRoot
as their build system.  From my understanding of ONIE, and my
understanding of BuildRoot, there would be very little that needed to
change for BuildRoot to support ONIE.

As I see it, the main contribution to BR from the ONIE community would
need to be def_*config files. One slight change to BR might be to allow
version specification for GCC, GlibC, Grub, Grub2, etc so that the user
would be able to specify the exact versions like the Linux kernel
selection already allows.  One other suggestion is that these options
also allow for specifying a patch location for each to get additional
patch files to use.  Having these options, I believe, would satisfy all
of the needs from the ONIE community.  Doing this would expand the BR
user base by quite a bit.

Food for thought.

Andy
