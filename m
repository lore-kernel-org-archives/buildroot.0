From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Apr 2017 12:02:22 +0200
Subject: [Buildroot] [PATCH v5 22/34] package/kodi-adsp-basic: bump
 version
In-Reply-To: <20170417195433.26672-23-bernd.kuhls@t-online.de>
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
 <20170417195433.26672-23-bernd.kuhls@t-online.de>
Message-ID: <20170423100222.GD7228@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-04-17 21:54 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/kodi-adsp-basic/kodi-adsp-basic.hash | 2 +-
>  package/kodi-adsp-basic/kodi-adsp-basic.mk   | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-adsp-basic/kodi-adsp-basic.hash b/package/kodi-adsp-basic/kodi-adsp-basic.hash
> index e668ff2aa..10dd773c1 100644
> --- a/package/kodi-adsp-basic/kodi-adsp-basic.hash
> +++ b/package/kodi-adsp-basic/kodi-adsp-basic.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256 0ae320af73085c322671d4b361248ff4341a6a04bd81c8b699847d5b04da828f kodi-adsp-basic-cb56e0eb6530fd50a286d47ef0be529001e9d556.tar.gz
> +sha256 d6ef031157ceb825a6e6ba114fb20c622ef7f396ddd17ae8bf1954aab25bc2af  kodi-adsp-basic-2ae604e591346741324663260696cfa231931870.tar.gz
> diff --git a/package/kodi-adsp-basic/kodi-adsp-basic.mk b/package/kodi-adsp-basic/kodi-adsp-basic.mk
> index f51594e12..bb114a41e 100644
> --- a/package/kodi-adsp-basic/kodi-adsp-basic.mk
> +++ b/package/kodi-adsp-basic/kodi-adsp-basic.mk
> @@ -4,7 +4,9 @@
>  #
>  ################################################################################
>  
> -KODI_ADSP_BASIC_VERSION = cb56e0eb6530fd50a286d47ef0be529001e9d556
> +# This cset is on the branch 'Krypton'
> +# When Kodi is updated, then this should be updated to the corresponding branch
> +KODI_ADSP_BASIC_VERSION = 2ae604e591346741324663260696cfa231931870
>  KODI_ADSP_BASIC_SITE = $(call github,kodi-adsp,adsp.basic,$(KODI_ADSP_BASIC_VERSION))
>  KODI_ADSP_BASIC_LICENSE = GPL-3.0+
>  KODI_ADSP_BASIC_LICENSE_FILES = LICENSE.md
> -- 
> 2.11.0
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
