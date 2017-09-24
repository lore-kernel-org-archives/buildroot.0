From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Sep 2017 16:15:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpfr: bump to version 3.1.6
In-Reply-To: <20170921164536.6373-1-bernd.kuhls@t-online.de>
References: <20170921164536.6373-1-bernd.kuhls@t-online.de>
Message-ID: <8d57f2f4-085b-81ea-f414-ac1fbd6f4e44@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-09-17 18:45, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/mpfr/mpfr.hash | 4 ++--
>  package/mpfr/mpfr.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mpfr/mpfr.hash b/package/mpfr/mpfr.hash
> index d2c32f2af5..1c825e1231 100644
> --- a/package/mpfr/mpfr.hash
> +++ b/package/mpfr/mpfr.hash
> @@ -1,2 +1,2 @@
> -# Locally calculated after checking pgp signature
> -sha256	015fde82b3979fbe5f83501986d328331ba8ddf008c1ff3da3c238f49ca062bc	mpfr-3.1.5.tar.xz
> +# From http://lists.gnu.org/archive/html/info-gnu/2017-09/msg00004.html
> +sha256 7a62ac1a04408614fccdc506e4844b10cf0ad2c2b1677097f8f35d3a1344a950  mpfr-3.1.6.tar.xz
> diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
> index 48dd487a28..1b67cf2e45 100644
> --- a/package/mpfr/mpfr.mk
> +++ b/package/mpfr/mpfr.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MPFR_VERSION = 3.1.5
> +MPFR_VERSION = 3.1.6
>  MPFR_SITE = http://www.mpfr.org/mpfr-$(MPFR_VERSION)
>  MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.xz
>  MPFR_LICENSE = LGPL-3.0+
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
