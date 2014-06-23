From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Jun 2014 22:56:03 +0200
Subject: [Buildroot] [PATCH] perl-mojolicious: bump to version 5.08
In-Reply-To: <1403548997-9688-1-git-send-email-francois.perrad@gadz.org>
References: <1403548997-9688-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140623205603.GD3572@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2014-06-23 20:43 +0200, Francois Perrad spake thusly:
> - switch to BackPan in order to prevent build breakage
> (like http://autobuild.buildroot.net/results/358/358f531f2db90b9bc3b1e4e2158c68d2bf6587fc/)
> - add license file
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/perl-mojolicious/perl-mojolicious.mk | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
> index 2c713e6..4d0de5e 100644
> --- a/package/perl-mojolicious/perl-mojolicious.mk
> +++ b/package/perl-mojolicious/perl-mojolicious.mk
> @@ -4,10 +4,11 @@
>  #
>  ################################################################################
>  
> -PERL_MOJOLICIOUS_VERSION = 5.07
> +PERL_MOJOLICIOUS_VERSION = 5.08
>  PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
> -PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI/
> +PERL_MOJOLICIOUS_SITE = http://backpan.perl.org/authors/id/S/SR/SRI/
>  PERL_MOJOLICIOUS_DEPENDENCIES = perl
>  PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
> +PERL_MOJOLICIOUS_LICENSE_FILES = LICENSE
>  
>  $(eval $(perl-package))
> -- 
> 1.9.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
