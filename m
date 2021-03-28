From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Mar 2021 23:06:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/libmbim: bump version to 1.24.6
In-Reply-To: <20210325180023.20646-1-petr.vorel@gmail.com>
References: <20210325180023.20646-1-petr.vorel@gmail.com>
Message-ID: <20210328210615.GV24043@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, All,

On 2021-03-25 19:00 +0100, Petr Vorel spake thusly:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libmbim/libmbim.hash | 4 ++--
>  package/libmbim/libmbim.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
> index 7ce1a2e7ae..b6a82e367d 100644
> --- a/package/libmbim/libmbim.hash
> +++ b/package/libmbim/libmbim.hash
> @@ -1,4 +1,4 @@
> -# Locally computed:
> -sha256  dd488ee6176243a6adb27a5872897336272ea7bea33a3ad501ba268e5a58b285  libmbim-1.24.4.tar.xz
> +# Locally computed
> +sha256  760465caaa1ccd699c14290e9791da456d5300dd11ebf4c1486151033e875dfd  libmbim-1.24.6.tar.xz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
> index 4ce3ca892e..175111381f 100644
> --- a/package/libmbim/libmbim.mk
> +++ b/package/libmbim/libmbim.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBMBIM_VERSION = 1.24.4
> +LIBMBIM_VERSION = 1.24.6
>  LIBMBIM_SITE = https://www.freedesktop.org/software/libmbim
>  LIBMBIM_SOURCE = libmbim-$(LIBMBIM_VERSION).tar.xz
>  LIBMBIM_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
> -- 
> 2.30.2
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
