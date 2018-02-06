From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Feb 2018 15:53:14 +0100
Subject: [Buildroot] [PATCH 2/4] linux: add custom linux logo
In-Reply-To: <1505819034-29610-3-git-send-email-angelo.compagnucci@gmail.com>
References: <1505819034-29610-1-git-send-email-angelo.compagnucci@gmail.com>
 <1505819034-29610-3-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20180206155314.74f1febc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Sep 2017 13:03:52 +0200, Angelo Compagnucci wrote:

> +config BR2_LINUX_KERNEL_CUSTOMLOGO
> +	bool "Kernel custom logo"
> +	select BR2_PACKAGE_CUSTOMLOGO
> +	help
> +	  Change the linux boot logo with your own graphics.
> +	  It can be used as an early bootsplash.
> +	  The file should be in kernel ppm format if the
> +	  option BR2_LINUX_KERNEL_CUSTOMLOGO_CONVERT is not
> +	  selected.

Forgot one thing here: this help text should mention that only the 224
version of the logo will be taken care of, not the mono and 16 variants.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
