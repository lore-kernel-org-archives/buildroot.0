From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Dec 2020 22:11:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/usbutils: bump to version 013
In-Reply-To: <20201213110306.750629-1-fontaine.fabrice@gmail.com>
References: <20201213110306.750629-1-fontaine.fabrice@gmail.com>
Message-ID: <20201213211155.GF3281876@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, all,

On 2020-12-13 12:03 +0100, Fabrice Fontaine spake thusly:
> Update indentation in hash file (two spaces)
> 
> https://github.com/gregkh/usbutils/blob/v013/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/usbutils/usbutils.hash | 6 +++---
>  package/usbutils/usbutils.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/usbutils/usbutils.hash b/package/usbutils/usbutils.hash
> index 4404913193..96426aeea2 100644
> --- a/package/usbutils/usbutils.hash
> +++ b/package/usbutils/usbutils.hash
> @@ -1,5 +1,5 @@
>  # From https://www.kernel.org/pub/linux/utils/usb/usbutils/sha256sums.asc
> -sha256	88634625f91840bc1993d2731cc081ee8d3b13d56069a95bdd6ac6ef0e063e46	usbutils-012.tar.xz
> +sha256  9e23494fcc78b7a80ee29a07dd179c95ae2f71509c35728dbbabc2d1cca41338  usbutils-013.tar.xz
>  # Locally calculated
> -sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	LICENSES/GPL-2.0.txt
> -sha256	3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986	LICENSES/GPL-3.0.txt
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0.txt
> +sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSES/GPL-3.0.txt
> diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
> index 2389386e50..ef5fd12013 100644
> --- a/package/usbutils/usbutils.mk
> +++ b/package/usbutils/usbutils.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -USBUTILS_VERSION = 012
> +USBUTILS_VERSION = 013
>  USBUTILS_SOURCE = usbutils-$(USBUTILS_VERSION).tar.xz
>  USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
>  USBUTILS_DEPENDENCIES = host-pkgconf libusb udev
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
