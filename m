From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2011 09:29:29 +0200
Subject: [Buildroot] [PATCH 2 of 2] linux: make vmlinux target available
 to all architectures
In-Reply-To: <154480348720d8530ebf.1316587576@localhost6.localdomain6>
References: <patchbomb.1316587574@localhost6.localdomain6>
 <154480348720d8530ebf.1316587576@localhost6.localdomain6>
Message-ID: <20110921092929.32fb4335@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 21 Sep 2011 08:46:16 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> The 'vmlinux' target in the linux build directory is a generic target. It may
> not be directly bootable for all architectures, but for projects where a custom
> bootloader is used, it can be of value.
> 
> Previously, this target was only available for mips architectures. This patch
> removes this restriction.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
