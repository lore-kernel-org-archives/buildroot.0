From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 15 Nov 2015 20:19:19 +0100
Subject: [Buildroot] [PATCH 3/6] package/perl-file-util: remove host
 variant
In-Reply-To: <4bdc0b12fe02ed22c775eabd485c17bbe4f372cb.1447449754.git.yann.morin.1998@free.fr>
References: <cover.1447449754.git.yann.morin.1998@free.fr>
 <4bdc0b12fe02ed22c775eabd485c17bbe4f372cb.1447449754.git.yann.morin.1998@free.fr>
Message-ID: <5648DAB7.3000909@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13-11-15 22:48, Yann E. MORIN wrote:
> It does not build, and no one depends on it.

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Confirmed that it doesn't build:
Can't locate Module/Build.pm

 Regards,
 Arnout

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Francois Perrad <fperrad@gmail.com>
> ---
>  package/perl-file-util/perl-file-util.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/perl-file-util/perl-file-util.mk b/package/perl-file-util/perl-file-util.mk
> index 2712aa4..fe83585 100644
> --- a/package/perl-file-util/perl-file-util.mk
> +++ b/package/perl-file-util/perl-file-util.mk
> @@ -12,4 +12,3 @@ PERL_FILE_UTIL_LICENSE = Artistic or GPLv1+
>  PERL_FILE_UTIL_LICENSE_FILES = COPYING LICENSE
>  
>  $(eval $(perl-package))
> -$(eval $(host-perl-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
