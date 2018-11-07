From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 7 Nov 2018 17:38:42 +0100
Subject: [Buildroot] Altering a package to pull from GIT
In-Reply-To: <CAJ+vNU2bzK3AD8BV6u_F-eXGdyKjGrrmGkyGT-e2kyRNxEE+zg@mail.gmail.com>
References: <CAJ+vNU2bzK3AD8BV6u_F-eXGdyKjGrrmGkyGT-e2kyRNxEE+zg@mail.gmail.com>
Message-ID: <20181107173842.1c7f0755@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 7 Nov 2018 08:17:47 -0800, Tim Harvey wrote:

> -OPENOCD_VERSION = 0.10.0
> +OPENOCD_VERSION = da4b2d5beb
>  OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
> -OPENOCD_SITE =
> http://sourceforge.net/projects/openocd/files/openocd/$(OPENOCD_VERSION)
> +OPENOCD_SITE = git://git.code.sf.net/p/openocd/code

> +OPENCOD_SITE_METHOD = git

       ^^^^ Typo here :-)

Also, the OPENOCD_SOURCE variable is no longer needed, but really the
issue comes from the typo.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
