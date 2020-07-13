From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jul 2020 18:31:38 +0200
Subject: [Buildroot] [PATCH 1/2] package/gssdp: bump to version 1.2.3
In-Reply-To: <20200713160820.1342225-1-fontaine.fabrice@gmail.com>
References: <20200713160820.1342225-1-fontaine.fabrice@gmail.com>
Message-ID: <20200713163138.GB18825@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-07-13 18:08 +0200, Fabrice Fontaine spake thusly:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Both patches (gssdp, gupnp) applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gssdp/gssdp.hash | 4 ++--
>  package/gssdp/gssdp.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gssdp/gssdp.hash b/package/gssdp/gssdp.hash
> index 8e00e7e56b..f31f21942a 100644
> --- a/package/gssdp/gssdp.hash
> +++ b/package/gssdp/gssdp.hash
> @@ -1,5 +1,5 @@
> -# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/1.2/gssdp-1.2.2.sha256sum:
> -sha256  cabb9e3b456b8354a55e23eb0207545d974643cda6d623523470ebbc4188b0a4  gssdp-1.2.2.tar.xz
> +# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/1.2/gssdp-1.2.3.sha256sum:
> +sha256  a263dcb6730e3b3dc4bbbff80cf3fab4cd364021981d419db6dd5a8e148aa7e8  gssdp-1.2.3.tar.xz
>  
>  # Hash for license file:
>  sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
> diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
> index 14eec0b5fd..02b10d961a 100644
> --- a/package/gssdp/gssdp.mk
> +++ b/package/gssdp/gssdp.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  GSSDP_VERSION_MAJOR = 1.2
> -GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).2
> +GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).3
>  GSSDP_SOURCE = gssdp-$(GSSDP_VERSION).tar.xz
>  GSSDP_SITE = http://ftp.gnome.org/pub/gnome/sources/gssdp/$(GSSDP_VERSION_MAJOR)
>  GSSDP_LICENSE = LGPL-2.0+
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
