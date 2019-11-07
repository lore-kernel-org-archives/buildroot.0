From: Carlos Santos <unixmania@gmail.com>
Date: Thu, 7 Nov 2019 09:32:02 -0300
Subject: [Buildroot] [PATCH] package/modem-manager: bump to version
 1.12.0
In-Reply-To: <20191107114003.1038623-1-aleksander@aleksander.es>
References: <20191107114003.1038623-1-aleksander@aleksander.es>
Message-ID: <CAJ4jsaeAmVbyX61-5pCSCrMySF-Rv+zewfXqFro+CFnkGX1ybw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 7, 2019 at 8:40 AM Aleksander Morgado
<aleksander@aleksander.es> wrote:
>
> Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
> ---
>  package/modem-manager/modem-manager.hash | 2 +-
>  package/modem-manager/modem-manager.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
> index fc826a6121..b1fef98fe2 100644
> --- a/package/modem-manager/modem-manager.hash
> +++ b/package/modem-manager/modem-manager.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  cbe174078dbdf3f746a55f0004353d3c27da2a31da553036d90fc7dc34a0169a  ModemManager-1.10.8.tar.xz
> +sha256  3daca86164145fffb589939433f596c13fa077c9a187c0d5820fdd5b4e4a6424  ModemManager-1.12.0.tar.xz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
> index a5f3d63560..b5aa7914f6 100644
> --- a/package/modem-manager/modem-manager.mk
> +++ b/package/modem-manager/modem-manager.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -MODEM_MANAGER_VERSION = 1.10.8
> +MODEM_MANAGER_VERSION = 1.12.0
>  MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
>  MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
>  MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
> --
> 2.24.0
>

I see "telit: fix crash if AT$GPSP=? is supported but no GPS data
port" in the Changelog. Is this a critical fix? If not, it should be
applied do next, since the 2019.11 release cycle has started.

Anyway,

Reviewed-by: Carlos Santos <unixmania@gmail.com>
