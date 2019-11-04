From: Aleksander Morgado <aleksander@aleksander.es>
Date: Mon, 4 Nov 2019 14:08:50 +0100
Subject: [Buildroot] [PATCH] package/modem-manager: bump to version
 1.10.8
In-Reply-To: <20191104124903.8193-1-unixmania@gmail.com>
References: <20191104124903.8193-1-unixmania@gmail.com>
Message-ID: <CAAP7ucLueRR7AhabqAfFKuzYw8tQSiMjRt6Nbre07=KUez3Zdg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 4, 2019 at 1:49 PM <unixmania@gmail.com> wrote:
>
> From: Carlos Santos <unixmania@gmail.com>
>
> Signed-off-by: Carlos Santos <unixmania@gmail.com>

Acked-by: Aleksander Morgado <aleksander@aleksander.es>

> ---
>  package/modem-manager/modem-manager.hash | 2 +-
>  package/modem-manager/modem-manager.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
> index 29ef47b036..fc826a6121 100644
> --- a/package/modem-manager/modem-manager.hash
> +++ b/package/modem-manager/modem-manager.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  3c2ca73782215664141042422759899ca9846440fc26d6223c7cf7ea4dd3c996  ModemManager-1.10.6.tar.xz
> +sha256  cbe174078dbdf3f746a55f0004353d3c27da2a31da553036d90fc7dc34a0169a  ModemManager-1.10.8.tar.xz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
> index 554d1a235e..ea9cf22f14 100644
> --- a/package/modem-manager/modem-manager.mk
> +++ b/package/modem-manager/modem-manager.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -MODEM_MANAGER_VERSION = 1.10.6
> +MODEM_MANAGER_VERSION = 1.10.8
>  MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
>  MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
>  MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
> --
> 2.18.1
>


-- 
Aleksander
https://aleksander.es
