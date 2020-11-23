From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 23 Nov 2020 20:40:30 +0100
Subject: [Buildroot] [PATCH 2/3] package/rpi-firmware: bump version to
 bff705f
In-Reply-To: <20201122214304.266821-3-davidb@230ruedubac.fr>
References: <20201122214304.266821-1-davidb@230ruedubac.fr>
 <20201122214304.266821-3-davidb@230ruedubac.fr>
Message-ID: <20201123204030.08778ca4@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello David,

thanks for taking care to update the rpi packages...

On Sun, 22 Nov 2020 22:43:03 +0100, David Barbion <davidb@230ruedubac.fr> wrote:

> Signed-off-by: David Barbion <davidb@230ruedubac.fr>
> ---
>  package/rpi-firmware/rpi-firmware.hash | 2 +-
>  package/rpi-firmware/rpi-firmware.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
> index 8730ec959b..117e95cffe 100644
> --- a/package/rpi-firmware/rpi-firmware.hash
> +++ b/package/rpi-firmware/rpi-firmware.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  c7a8c2b8cfe1977095d62086d340d6c15a383562aba2742e21df7f5f792aeb4b  rpi-firmware-358f4c271f2bc10931aae8fe0879ffaded8b9c44.tar.gz
> +sha256  e60363ce94c4a78e4a2d41c982a887ac9d31c4997fe793c37ab5690beed3078d  rpi-firmware-bff705fffe59ad3eea33999beb29c3f26408de40.tar.gz
>  sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index 8b2b2c7154..bcd52578a6 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -RPI_FIRMWARE_VERSION = 358f4c271f2bc10931aae8fe0879ffaded8b9c44
> +RPI_FIRMWARE_VERSION = bff705fffe59ad3eea33999beb29c3f26408de40
>  RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
>  RPI_FIRMWARE_LICENSE = BSD-3-Clause
>  RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom

A bump of rpi-firmware version should although bump rpi-userland and the rpi
defconfigs (LINUX_KERNEL) to keep them in sync....

Mind to re-spin your patchset (maybe updated to latest, 6 hour old, bump to
kernel 5.4.79 ;-) [1])...

Regards,
Peter

[1]  https://github.com/raspberrypi/firmware/commit/8f13114b9ea29bd004151d4a8afa500b2df721be
