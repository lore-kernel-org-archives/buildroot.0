From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Oct 2011 10:31:35 +0200
Subject: [Buildroot] error building kernel with initramfs
In-Reply-To: <1318027748.4647.3.camel@bender>
References: <1318027748.4647.3.camel@bender>
Message-ID: <20111008103135.6ca868bd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 08 Oct 2011 00:49:08 +0200,
Sven Neumann <s.neumann@raumfeld.com> a ?crit :

> I guess the fix for this is to change fs/initramfs/Config.in to select
> BR2_TARGET_ROOTFS_CPIO_NONE, right ?

Yes, I guess so.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
