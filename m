From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Aug 2012 18:44:35 +0200
Subject: [Buildroot] [PATCH 2/2] fbterm pckg check for libexpat & libZ
 Signed-off-by: JoM <johann.mercadier@imerir.com>
In-Reply-To: <1332372417-5120-2-git-send-email-johann.mercadier@imerir.com>
References: <1332372417-5120-1-git-send-email-johann.mercadier@imerir.com>
 <1332372417-5120-2-git-send-email-johann.mercadier@imerir.com>
Message-ID: <20120817184435.350a3d83@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 21 Mar 2012 23:26:56 +0000,
JoM <johann.mercadier@imerir.com> a ?crit :

> +ifeq ($(BR2_PACKAGE_ZLIB),y)
> +	FBTERM_DEPENDENCIES += zlib
> +endif
> +
> +FBTERM_DEPENDENCIES += $(if $(BR2_PACKAGE_EXPAT),expat)
> +

I don't understand why it is needed: I don't see any expat or zlib
related code in fbterm. Can you detail?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
