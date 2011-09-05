From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Sep 2011 08:57:31 +0200
Subject: [Buildroot] [PATCH 1/2] grub: build for host
In-Reply-To: <20110821165154.25078.86917.stgit@darius-desktop>
References: <20110821165154.25078.86917.stgit@darius-desktop>
Message-ID: <20110905085731.60859d50@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Sun, 21 Aug 2011 19:51:54 +0300,
Darius Augulis <augulis.darius@gmail.com> a ?crit :

> +GRUB_DEPENDENCIES = host-grub 

This raises a question similar to the one I asked for syslinux, but in
the opposite side. I don't think host-grub is a build dependency of the
target grub (i.e the target grub *can* be compiled without host-grub
being compiled), even though host-grub might be useful when grub is
enabled.

What should we do in this case? At least we should have a consistent
decision between syslinux (patches by Arnout) and grub (patches by
Darius).

I think we should create in the documentation a "Package specific
comments" part, in which we could detail some subtleties of various
packages.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
