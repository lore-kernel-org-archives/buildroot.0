From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Apr 2013 04:23:36 +0200
Subject: [Buildroot] [PATCH] fs/ubifs: factorize all the "depends on"
 into "if...endif" blocks
In-Reply-To: <20130424212620.GC24710@free.fr>
References: <5177D061.6020905@newflow.co.uk> <20130424212620.GC24710@free.fr>
Message-ID: <20130425042336.1c084175@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 24 Apr 2013 23:26:20 +0200, Yann E. MORIN wrote:

> Comment the endif-s so we know at a glance to which if they belong to:
> 
> +endif # BR2_TARGET_ROOTFS_UBI
> +
> +endif # BR2_TARGET_ROOTFS_UBIFS
> 
> With that fixed:
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Agreed.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
