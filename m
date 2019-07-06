From: Carlos Santos <unixmania@gmail.com>
Date: Sat, 6 Jul 2019 07:43:23 -0300
Subject: [Buildroot] [PATCH 1/1] package/libqmi: bump to version 1.22.4
In-Reply-To: <20190705210800.20864-1-fontaine.fabrice@gmail.com>
References: <20190705210800.20864-1-fontaine.fabrice@gmail.com>
Message-ID: <CAJ4jsafZ_vw4dcnBog_YvY=UDT7JorrpHDMg9uJ46nfHdx4Qzw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 5, 2019 at 6:08 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> libqmi >= 1.22.4 is needed by modem-manager 1.10.2
>
> Fixes:
>  - http://autobuild.buildroot.org/results/14e11c6136db09b36d84246a7472b77bb4bfdd19
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libqmi/libqmi.hash | 2 +-
>  package/libqmi/libqmi.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
> index 0c27451ec2..7d622cb702 100644
> --- a/package/libqmi/libqmi.hash
> +++ b/package/libqmi/libqmi.hash
> @@ -1,4 +1,4 @@
>  # Locally computed:
> -sha256 21c198b481f1617bb7edb1960d823569de3e38b269dbf513af1b56048cafaa17  libqmi-1.22.0.tar.xz
> +sha256 4c5b8e7bde4144ad875e9efaccd05bcc9b830c9a114df63aa2be8eb5d3caf9f1  libqmi-1.22.4.tar.xz
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
> index 319c2362bf..302e938c62 100644
> --- a/package/libqmi/libqmi.mk
> +++ b/package/libqmi/libqmi.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -LIBQMI_VERSION = 1.22.0
> +LIBQMI_VERSION = 1.22.4
>  LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
>  LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
>  LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)

Tested-by: Carlos Santos <unixmania@gmail.com>
---
Verified that modem-manager builds correctly after this change.
