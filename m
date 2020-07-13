From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jul 2020 19:11:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/lcms2: bump to version 2.11
In-Reply-To: <20200713161458.1349913-1-fontaine.fabrice@gmail.com>
References: <20200713161458.1349913-1-fontaine.fabrice@gmail.com>
Message-ID: <20200713171113.GG18825@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-07-13 18:14 +0200, Fabrice Fontaine spake thusly:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/lcms2/lcms2.hash | 6 +++---
>  package/lcms2/lcms2.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/lcms2/lcms2.hash b/package/lcms2/lcms2.hash
> index 1d83fcb2ba..c0916820f7 100644
> --- a/package/lcms2/lcms2.hash
> +++ b/package/lcms2/lcms2.hash
> @@ -1,5 +1,5 @@
> -# From https://sourceforge.net/projects/lcms/files/lcms/2.10
> -sha1  59bcebaf15c1c4b21815708cb68498b9b5d40db3  lcms2-2.10.tar.gz
> +# From https://sourceforge.net/projects/lcms/files/lcms/2.11
> +sha1  7413047c74de29e20caa5c9afc1b12bf07bbf7a7  lcms2-2.11.tar.gz
>  # Locally computed:
> -sha256  e11bc4e538587ec1530f9fef25f77261b94d5886c5ea81d8bb171a802df970ad  lcms2-2.10.tar.gz
> +sha256  dc49b9c8e4d7cdff376040571a722902b682a795bf92985a85b48854c270772e  lcms2-2.11.tar.gz
>  sha256  53ad5ca11b8f4079e9c9bfa61575927a33f53526d6d414287149ec3ab61e8e4d  COPYING
> diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
> index 6929825f69..d42c8c9a1f 100644
> --- a/package/lcms2/lcms2.mk
> +++ b/package/lcms2/lcms2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LCMS2_VERSION = 2.10
> +LCMS2_VERSION = 2.11
>  LCMS2_SITE = http://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
>  LCMS2_LICENSE = MIT
>  LCMS2_LICENSE_FILES = COPYING
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
