From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Jun 2020 21:24:18 +0200
Subject: [Buildroot] [PATCH] package/libcurl: security bump to version
 7.71.0
In-Reply-To: <59cdc3789225ac3861f527311661488be9e532d8.1593022160.git.baruch@tkos.co.il>
References: <59cdc3789225ac3861f527311661488be9e532d8.1593022160.git.baruch@tkos.co.il>
Message-ID: <20200624192418.GF20645@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2020-06-24 21:09 +0300, Baruch Siach spake thusly:
> CVE-2020-8177: curl overwrite local file with -J.
> 
> CVE-2020-8169: Partial password leak over DNS on HTTP redirect.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied to master, thanks!

Regards,
Yann E. MORIN.

> ---
>  package/libcurl/libcurl.hash | 2 +-
>  package/libcurl/libcurl.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
> index 2157f3d2d21d..104d603f3e0f 100644
> --- a/package/libcurl/libcurl.hash
> +++ b/package/libcurl/libcurl.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
>  sha256  db3c4a3b3695a0f317a0c5176acd2f656d18abc45b3ee78e50935a78eb1e132e  COPYING
> -sha256  032f43f2674008c761af19bf536374128c16241fb234699a55f9fb603fcfbae7  curl-7.70.0.tar.xz
> +sha256  cdf18794393d8bead915312708a9e5d819c6e9919de14b20d5c8e7987abd9772  curl-7.71.0.tar.xz
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index cc2ca0aa65a2..11748924ffae 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBCURL_VERSION = 7.70.0
> +LIBCURL_VERSION = 7.71.0
>  LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
>  LIBCURL_SITE = https://curl.haxx.se/download
>  LIBCURL_DEPENDENCIES = host-pkgconf \
> -- 
> 2.27.0
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
