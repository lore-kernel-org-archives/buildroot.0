From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 5 Dec 2020 11:55:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/rpi-wifi-firmware: bump version
 to 9c0ffe
In-Reply-To: <20201205083032.25431-1-christian@paral.in>
References: <20201205083032.25431-1-christian@paral.in>
Message-ID: <20201205115502.5b838a57@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,


first thanks for the patch ;-)

Please try to trim your CC list (hint: try out utils/get-developers  <your_patch>)...

There is already a patch series bumping the rpi firmwares (rpi-bt-firmware [1],
rpi-firmware [2] and rpi-wifi-firmware [3]) pre-dating your patch..., I would
like to see the rpi defconfigs linux kernel version bumped in sync with the
rpi-firmware..., mind to take over the existing patchset and add the defconfigs bump
(or maybe I find some time for it the next days...)?

Regards,
Peter


[1] https://patchwork.ozlabs.org/project/buildroot/patch/20201122214304.266821-2-davidb at 230ruedubac.fr/
[2] https://patchwork.ozlabs.org/project/buildroot/patch/20201122214304.266821-3-davidb at 230ruedubac.fr/
[3] https://patchwork.ozlabs.org/project/buildroot/patch/20201122214304.266821-4-davidb at 230ruedubac.fr/


On Sat,  5 Dec 2020 00:30:32 -0800, Christian Stewart <christian@paral.in> wrote:

> Sync with RPi-Distro repos, add Pi 400 firmware.
>
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/rpi-wifi-firmware/rpi-wifi-firmware.hash | 2 +-
>  package/rpi-wifi-firmware/rpi-wifi-firmware.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.hash b/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
> index b8931d2c45..4bea20beb3 100644
> --- a/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
> +++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  05db087504be2f6bc1d902cca605114c7f9d458be0adb3b8026369357a329f7a  rpi-wifi-firmware-d4f7087ecbc8eff9cb64a4650765697157821d64.tar.gz
> +sha256  cf806f6bdba0f803b90bc210f524a6ac37bac7ad19306c61474bb2dc59875e87  rpi-wifi-firmware-9c0ffe9a7f0753b36ed88f7981905a989d940ea9.tar.gz
>  sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d   LICENCE.broadcom_bcm43xx
> diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
> index 6be02509fe..24ba5941b0 100644
> --- a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
> +++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -RPI_WIFI_FIRMWARE_VERSION = d4f7087ecbc8eff9cb64a4650765697157821d64
> +RPI_WIFI_FIRMWARE_VERSION = 9c0ffe9a7f0753b36ed88f7981905a989d940ea9
>  RPI_WIFI_FIRMWARE_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(RPI_WIFI_FIRMWARE_VERSION))
>  RPI_WIFI_FIRMWARE_LICENSE = PROPRIETARY
>  RPI_WIFI_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
