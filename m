From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Jun 2021 21:56:57 +0200
Subject: [Buildroot] [PATCH 1/6] package/perl-convert-asn1: bump to
 version 0.31
In-Reply-To: <20210607175604.2850795-1-francois.perrad@gadz.org>
References: <20210607175604.2850795-1-francois.perrad@gadz.org>
Message-ID: <20210614195657.GC2610983@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2021-06-07 19:55 +0200, Francois Perrad spake thusly:
> diff LICENSE:
> - This software is copyright (c) 2014 by Graham Barr.
> + This software is copyright (c) 2021 by Graham Barr.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Series of 6 patches: applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/perl-convert-asn1/perl-convert-asn1.hash | 6 +++---
>  package/perl-convert-asn1/perl-convert-asn1.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/perl-convert-asn1/perl-convert-asn1.hash b/package/perl-convert-asn1/perl-convert-asn1.hash
> index 4fd7d3eb6..eb7973c31 100644
> --- a/package/perl-convert-asn1/perl-convert-asn1.hash
> +++ b/package/perl-convert-asn1/perl-convert-asn1.hash
> @@ -1,6 +1,6 @@
>  # retrieved by scancpan from http://cpan.metacpan.org/
> -md5    68723e96be0b258a9e20480276e8a62c Convert-ASN1-0.27.tar.gz
> -sha256 74a4a78ae0c5e973100ac0a8f203a110f76fb047b79dae4fc1fd7d6814d3d58a Convert-ASN1-0.27.tar.gz
> +md5  1e12b263a5042804bb1c59ddce899876  Convert-ASN1-0.31.tar.gz
> +sha256  6fe4c1ba744c3a8212bf2c9b2703d93530acc153435cf2f93633540b439fbbeb  Convert-ASN1-0.31.tar.gz
>  
>  # computed by scancpan
> -sha256 4ef46cc39d9e2b4c767503457a1f8fda5bcf9c0c164923e2a54a3863209cf237 LICENSE
> +sha256  db9e46a932b02253c8bddc05a44a0c1c6979627190afb2251dd76462dd370d79  LICENSE
> diff --git a/package/perl-convert-asn1/perl-convert-asn1.mk b/package/perl-convert-asn1/perl-convert-asn1.mk
> index b6ba76a7e..c39fe3412 100644
> --- a/package/perl-convert-asn1/perl-convert-asn1.mk
> +++ b/package/perl-convert-asn1/perl-convert-asn1.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PERL_CONVERT_ASN1_VERSION = 0.27
> +PERL_CONVERT_ASN1_VERSION = 0.31
>  PERL_CONVERT_ASN1_SOURCE = Convert-ASN1-$(PERL_CONVERT_ASN1_VERSION).tar.gz
> -PERL_CONVERT_ASN1_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GB/GBARR
> +PERL_CONVERT_ASN1_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TI/TIMLEGGE
>  PERL_CONVERT_ASN1_LICENSE = Artistic or GPL-1.0+
>  PERL_CONVERT_ASN1_LICENSE_FILES = LICENSE
>  PERL_CONVERT_ASN1_DISTNAME = Convert-ASN1
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
