From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Feb 2014 07:30:48 +0100
Subject: [Buildroot] [pkg-perl infra V8 4/6] host-perl-module-build: new
 package
In-Reply-To: <1392139307-29635-5-git-send-email-francois.perrad@gadz.org>
References: <1392139307-29635-1-git-send-email-francois.perrad@gadz.org>
 <1392139307-29635-5-git-send-email-francois.perrad@gadz.org>
Message-ID: <52FB1518.2070209@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/02/14 18:21, Francois Perrad wrote:
> the version coming with host-perl is too old
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  package/perl-module-build/perl-module-build.mk |   12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 package/perl-module-build/perl-module-build.mk
> 
> diff --git a/package/perl-module-build/perl-module-build.mk b/package/perl-module-build/perl-module-build.mk
> new file mode 100644
> index 0000000..a95278d
> --- /dev/null
> +++ b/package/perl-module-build/perl-module-build.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# perl-module-build
> +#
> +################################################################################
> +
> +PERL_MODULE_BUILD_VERSION = 0.4204
> +PERL_MODULE_BUILD_SOURCE = Module-Build-$(PERL_MODULE_BUILD_VERSION).tar.gz
> +PERL_MODULE_BUILD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT/
> +PERL_MODULE_BUILD_LICENSE = Artistic or GPLv1+
> +
> +$(eval $(host-perl-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
