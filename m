From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 20:54:49 +0200
Subject: [Buildroot] [PATCH 4/5] perl-gdtextutil: new package
In-Reply-To: <1405614782-3667-4-git-send-email-francois.perrad@gadz.org>
References: <1405614782-3667-1-git-send-email-francois.perrad@gadz.org>
 <1405614782-3667-4-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140717205449.08cc1182@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Thu, 17 Jul 2014 18:33:01 +0200, Francois Perrad wrote:

> diff --git a/package/perl-gdtextutil/perl-gdtextutil.mk b/package/perl-gdtextutil/perl-gdtextutil.mk
> new file mode 100644
> index 0000000..6a5c2d7
> --- /dev/null
> +++ b/package/perl-gdtextutil/perl-gdtextutil.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# perl-gdtextutil
> +#
> +################################################################################
> +
> +PERL_GDTEXTUTIL_VERSION = 0.86
> +PERL_GDTEXTUTIL_SOURCE = GDTextUtil-$(PERL_GDTEXTUTIL_VERSION).tar.gz
> +PERL_GDTEXTUTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MV/MVERB/
> +PERL_GDTEXTUTIL_DEPENDENCIES = perl
> +
> +$(eval $(perl-package))

No license / license file?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
