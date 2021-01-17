From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 15:35:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/pulseaudio: bump version to 14.2
In-Reply-To: <20210117132727.2847597-1-bernd.kuhls@t-online.de>
References: <20210117132727.2847597-1-bernd.kuhls@t-online.de>
Message-ID: <20210117143521.GJ2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2021-01-17 14:27 +0100, Bernd Kuhls spake thusly:
> Release notes:
> https://lists.freedesktop.org/archives/pulseaudio-discuss/2021-January/031990.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pulseaudio/pulseaudio.hash | 4 ++--
>  package/pulseaudio/pulseaudio.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pulseaudio/pulseaudio.hash b/package/pulseaudio/pulseaudio.hash
> index 5989f8e920..b3e19fdcca 100644
> --- a/package/pulseaudio/pulseaudio.hash
> +++ b/package/pulseaudio/pulseaudio.hash
> @@ -1,5 +1,5 @@
> -# From https://lists.freedesktop.org/archives/pulseaudio-discuss/2021-January/031986.html
> -sha256  b0bcca2a45e4fe1f73c7709dcf75a17dd5235688d5d150069e765dda4884b837  pulseaudio-14.1.tar.xz
> +# From https://lists.freedesktop.org/archives/pulseaudio-discuss/2021-January/031990.html
> +sha256  75d3f7742c1ae449049a4c88900e454b8b350ecaa8c544f3488a2562a9ff66f1  pulseaudio-14.2.tar.xz
>  # Locally computed
>  sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  GPL
>  sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LGPL
> diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
> index 472a1d3943..ad1710c6f7 100644
> --- a/package/pulseaudio/pulseaudio.mk
> +++ b/package/pulseaudio/pulseaudio.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PULSEAUDIO_VERSION = 14.1
> +PULSEAUDIO_VERSION = 14.2
>  PULSEAUDIO_SOURCE = pulseaudio-$(PULSEAUDIO_VERSION).tar.xz
>  PULSEAUDIO_SITE = https://freedesktop.org/software/pulseaudio/releases
>  PULSEAUDIO_INSTALL_STAGING = YES
> -- 
> 2.29.2
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
