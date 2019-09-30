From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 23:04:22 +0200
Subject: [Buildroot] [PATCH 2/2] package/gcc: add support for D language
In-Reply-To: <20190929165601.20269-3-eric.le.bihan.dev@free.fr>
References: <20190929165601.20269-1-eric.le.bihan.dev@free.fr>
 <20190929165601.20269-3-eric.le.bihan.dev@free.fr>
Message-ID: <20190930230422.7a7d1173@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Eric,

On Sun, 29 Sep 2019 18:56:01 +0200
Eric Le Bihan <eric.le.bihan.dev@free.fr> wrote:

> +config BR2_TOOLCHAIN_BUILDROOT_DLANG
> +	bool "Enable D language support"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	depends on BR2_TOOLCHAIN_USES_GLIBC

Could you explain why glibc is necessary as a dependency here ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
