From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Mar 2020 21:52:00 +0200
Subject: [Buildroot] [PATCH v3 4/7] package/gssdp: bump version to 1.2.2
In-Reply-To: <20200327183000.1005676-4-aduskett@gmail.com>
References: <20200327183000.1005676-1-aduskett@gmail.com>
 <20200327183000.1005676-4-aduskett@gmail.com>
Message-ID: <20200329195200.GO22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-03-27 11:29 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

This version bump and the one for gupnp applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gssdp/gssdp.hash | 4 ++--
>  package/gssdp/gssdp.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/gssdp/gssdp.hash b/package/gssdp/gssdp.hash
> index b389d0205c..325ac00171 100644
> --- a/package/gssdp/gssdp.hash
> +++ b/package/gssdp/gssdp.hash
> @@ -1,5 +1,5 @@
> -# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/1.0/gssdp-1.0.3.sha256sum:
> -sha256 211387a62bc1d99821dd0333d873a781320287f5436f91e58b2ca145b378be41  gssdp-1.0.3.tar.xz
> +# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/1.2/gssdp-1.2.2.sha256sum:
> +sha256 cabb9e3b456b8354a55e23eb0207545d974643cda6d623523470ebbc4188b0a4  gssdp-1.2.2.tar.xz
>  
>  # Hash for license file:
>  sha256 d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
> diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
> index d91c8acda0..14eec0b5fd 100644
> --- a/package/gssdp/gssdp.mk
> +++ b/package/gssdp/gssdp.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -GSSDP_VERSION_MAJOR = 1.0
> -GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).3
> +GSSDP_VERSION_MAJOR = 1.2
> +GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).2
>  GSSDP_SOURCE = gssdp-$(GSSDP_VERSION).tar.xz
>  GSSDP_SITE = http://ftp.gnome.org/pub/gnome/sources/gssdp/$(GSSDP_VERSION_MAJOR)
>  GSSDP_LICENSE = LGPL-2.0+
> -- 
> 2.25.1
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
