From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Mar 2021 23:51:05 +0100
Subject: [Buildroot] [PATCH v1] package/libinput: bump version to 1.17.0
In-Reply-To: <20210308193354.7115-1-ps.report@gmx.net>
References: <20210308193354.7115-1-ps.report@gmx.net>
Message-ID: <20210308225105.GG2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-03-08 20:33 +0100, Peter Seiderer spake thusly:
> For details see [1].
> 
> [1] https://lists.freedesktop.org/archives/wayland-devel/2021-February/041733.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libinput/libinput.hash | 6 +++---
>  package/libinput/libinput.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
> index 1664afbac8..f39ba3dbb6 100644
> --- a/package/libinput/libinput.hash
> +++ b/package/libinput/libinput.hash
> @@ -1,6 +1,6 @@
> -# From https://lists.freedesktop.org/archives/wayland-devel/2021-February/041734.html
> -sha256  42d404af037a0dcc9dee7a1ab0a8e53cec0b62902fc4a262e5be9d2b7452c214  libinput-1.16.5.tar.xz
> -sha512  b2fdd87375cbd5b212f76cefedfaa146966dde1d5e5d566beadd3167749dc3667214946178b157fa4b44360dc6b86a25ffb0356049cdf5a57d0fa2b8e3fcb1e9  libinput-1.16.5.tar.xz
> +# From https://lists.freedesktop.org/archives/wayland-devel/2021-February/041733.html
> +sha256  c560cfca14cb5c50d2a1b7551df06bc5d4306e32c128f3e3d37e137285dedbad  libinput-1.17.0.tar.xz
> +sha512  490c7e59cbaa43e4190dbc421582dca887b6ae92304c4f8f3ea9df515bd76de41ca9a376e6f1cfe7b235dd2d5d8d8ef5982f5ddcf958e3b31b981e9440bb0888  libinput-1.17.0.tar.xz
>  
>  # License files
>  sha256  70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14  COPYING
> diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
> index cbe4bb124f..982d92d062 100644
> --- a/package/libinput/libinput.mk
> +++ b/package/libinput/libinput.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBINPUT_VERSION = 1.16.5
> +LIBINPUT_VERSION = 1.17.0
>  LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
>  LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
>  LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
> -- 
> 2.30.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
