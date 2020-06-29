From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jun 2020 22:06:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpd: bump to version 0.21.24
In-Reply-To: <20200629055643.196222-1-joerg.krause@embedded.rocks>
References: <20200629055643.196222-1-joerg.krause@embedded.rocks>
Message-ID: <20200629200616.GM20645@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg, All,

On 2020-06-29 07:56 +0200, J?rg Krause spake thusly:
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mpd/mpd.hash | 2 +-
>  package/mpd/mpd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
> index fd045e0f5e..b78bc93bb9 100644
> --- a/package/mpd/mpd.hash
> +++ b/package/mpd/mpd.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated after checking pgp signature
> -sha256  439f522ca9800f375e4fb459ec31e61b3d824fc5c0580ff06dac48b5d21207a3  mpd-0.21.23.tar.xz
> +sha256  84632a7e82e672b3a6d71651a75d05fb7acd62645c33e3f3af5a1067cfa64cd6  mpd-0.21.24.tar.xz
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
> index 474927749a..a1fa4b0a5e 100644
> --- a/package/mpd/mpd.mk
> +++ b/package/mpd/mpd.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  MPD_VERSION_MAJOR = 0.21
> -MPD_VERSION = $(MPD_VERSION_MAJOR).23
> +MPD_VERSION = $(MPD_VERSION_MAJOR).24
>  MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
>  MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
>  MPD_DEPENDENCIES = host-pkgconf boost
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
