From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 20 Jul 2021 18:23:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/rpi-firmware: bump to version
 33e09977ff3b02967d191801e3361224455acb9d
In-Reply-To: <20210720015810.3718225-1-james.hilliard1@gmail.com>
References: <20210720015810.3718225-1-james.hilliard1@gmail.com>
Message-ID: <20210720182344.2f904646@gmx.net>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello James,

On Mon, 19 Jul 2021 19:58:10 -0600, James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/rpi-firmware/rpi-firmware.hash | 2 +-
>  package/rpi-firmware/rpi-firmware.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
> index 2abc920161..7127b2d824 100644
> --- a/package/rpi-firmware/rpi-firmware.hash
> +++ b/package/rpi-firmware/rpi-firmware.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  3ce2105247a91ffa86d317e7810e110b601a094d6781a219996d8bc9fbe98c6f  rpi-firmware-0e5a49eb2f7f066876c69cf5fe61625fb5c32f67.tar.gz
> +sha256  5eaff5da660d6ecd74bb2c927d7a1ba84b5e5c5582f02e65aec058af2ffe50f4  rpi-firmware-33e09977ff3b02967d191801e3361224455acb9d.tar.gz
>  sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index 829f265c8e..181650fa08 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -RPI_FIRMWARE_VERSION = 0e5a49eb2f7f066876c69cf5fe61625fb5c32f67
> +RPI_FIRMWARE_VERSION = 33e09977ff3b02967d191801e3361224455acb9d
>  RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
>  RPI_FIRMWARE_LICENSE = BSD-3-Clause
>  RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom

Out of interest, any special/needed commits since the last bump?

Regards,
Peter
