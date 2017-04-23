From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Apr 2017 12:03:10 +0200
Subject: [Buildroot] [PATCH v5 23/34] package/kodi-adsp-freesurround:
 bump version
In-Reply-To: <20170417195433.26672-24-bernd.kuhls@t-online.de>
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
 <20170417195433.26672-24-bernd.kuhls@t-online.de>
Message-ID: <20170423100310.GE7228@scaer>
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
>  package/kodi-adsp-freesurround/kodi-adsp-freesurround.hash | 2 +-
>  package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk   | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-adsp-freesurround/kodi-adsp-freesurround.hash b/package/kodi-adsp-freesurround/kodi-adsp-freesurround.hash
> index f23717f79..2649bbdcb 100644
> --- a/package/kodi-adsp-freesurround/kodi-adsp-freesurround.hash
> +++ b/package/kodi-adsp-freesurround/kodi-adsp-freesurround.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256 652c32d0c4b61343cbed13b6edd1ab4ad35280240a0ddb386f04adaa46986e7f kodi-adsp-freesurround-08b691d3d9a0382d2f6f789a31614fb02512036c.tar.gz
> +sha256 cf6985be6839530027861b54e2146693d05e802363281ef6f8c1f352dbf94b5c  kodi-adsp-freesurround-34f50406bcba22e364711562e5b9205e57ae844b.tar.gz
> diff --git a/package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk b/package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk
> index c387d891c..927af74da 100644
> --- a/package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk
> +++ b/package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk
> @@ -4,7 +4,9 @@
>  #
>  ################################################################################
>  
> -KODI_ADSP_FREESURROUND_VERSION = 08b691d3d9a0382d2f6f789a31614fb02512036c
> +# This cset is on the branch 'Krypton'
> +# When Kodi is updated, then this should be updated to the corresponding branch
> +KODI_ADSP_FREESURROUND_VERSION = 34f50406bcba22e364711562e5b9205e57ae844b
>  KODI_ADSP_FREESURROUND_SITE = $(call github,kodi-adsp,adsp.freesurround,$(KODI_ADSP_FREESURROUND_VERSION))
>  KODI_ADSP_FREESURROUND_LICENSE = GPL-3.0+
>  KODI_ADSP_FREESURROUND_LICENSE_FILES = LICENSE.md
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
