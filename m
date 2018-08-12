From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 23:14:29 +0200
Subject: [Buildroot] [PATCH 02/18] perl-astro-suntime: new package
In-Reply-To: <20180810161502.21598-3-chrismcc@gmail.com>
References: <20180810161502.21598-1-chrismcc@gmail.com>
 <20180810161502.21598-3-chrismcc@gmail.com>
Message-ID: <20180812231429.107ea19b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Aug 2018 09:14:46 -0700, Christopher McCrory wrote:
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  package/Config.in                                  |  1 +
>  package/perl-astro-suntime/Config.in               |  6 ++++++
>  package/perl-astro-suntime/perl-astro-suntime.hash |  6 ++++++
>  package/perl-astro-suntime/perl-astro-suntime.mk   | 14 ++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/perl-astro-suntime/Config.in
>  create mode 100644 package/perl-astro-suntime/perl-astro-suntime.hash
>  create mode 100644 package/perl-astro-suntime/perl-astro-suntime.mk

I've applied to next. The entry in the DEVELOPERS file was missing.

> +PERL_ASTRO_SUNTIME_VERSION = 0.06
> +PERL_ASTRO_SUNTIME_SOURCE = Astro-SunTime-$(PERL_ASTRO_SUNTIME_VERSION).tar.gz
> +PERL_ASTRO_SUNTIME_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RO/ROBF
> +PERL_ASTRO_SUNTIME_DEPENDENCIES = host-perl-module-build
> +PERL_ASTRO_SUNTIME_LICENSE = gpl_3

gpl_3 is not correct, it should have been GPL-3.0.

Fran?ois, is this a bug in scancpan ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
