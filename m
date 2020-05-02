From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 May 2020 19:13:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/rtl8723bu: bump version to
 c9549d172a4f9d6ccf6d528682640246a41c2f0c
In-Reply-To: <20200430125817.2982-1-mf@go-sys.de>
References: <20200430125817.2982-1-mf@go-sys.de>
Message-ID: <20200502171324.GQ15673@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael, All,

On 2020-04-30 14:58 +0200, Michael Fischer spake thusly:
> Signed-off-by: Michael Fischer <mf@go-sys.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/rtl8723bu/rtl8723bu.hash | 2 +-
>  package/rtl8723bu/rtl8723bu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
> index ef4eddaa63..3a5e0152cc 100644
> --- a/package/rtl8723bu/rtl8723bu.hash
> +++ b/package/rtl8723bu/rtl8723bu.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256 da04cffc306d9738abdc67d234b8948db6ca97ed77760c68d99d18817839a513 rtl8723bu-b922079a090dcaad58179d478442ff97f18521c9.tar.gz
> +sha256 19dae2b8b2c14b1f428c34ddb343fa41ddf9ae79bdefcb7c5baa65d357ca5a45 rtl8723bu-c9549d172a4f9d6ccf6d528682640246a41c2f0c.tar.gz
> diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
> index 942b13bbf6..c54b2ef0da 100644
> --- a/package/rtl8723bu/rtl8723bu.mk
> +++ b/package/rtl8723bu/rtl8723bu.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RTL8723BU_VERSION = b922079a090dcaad58179d478442ff97f18521c9
> +RTL8723BU_VERSION = c9549d172a4f9d6ccf6d528682640246a41c2f0c
>  RTL8723BU_SITE = $(call github,lwfinger,rtl8723bu,$(RTL8723BU_VERSION))
>  RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
>  
> -- 
> 2.26.1
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
