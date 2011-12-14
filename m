From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Dec 2011 09:40:45 +0100
Subject: [Buildroot] buildroot with SquashFS root file system
In-Reply-To: <201112131818.53512.arnout@mind.be>
References: <4EDE32C3.7020400@neotion.com> <201112131818.53512.arnout@mind.be>
Message-ID: <20111214094045.59167319@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 13 Dec 2011 18:18:53 +0100,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>  Hm, my assumption that you would only use an initramfs with a 
> cpio archive was clearly wrong.  So perhaps we should execute the 
> ROOTFS_CPIO_ADD_INIT hook unconditionally for all filesystems?

I'd prefer not to. I don't want this wrapper script in all filesystems
just to solve the initramfs problem, because it is useless for the
filesystem is not used as an initramfs filesystem.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
