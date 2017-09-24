From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Sep 2017 13:55:06 +0200
Subject: [Buildroot] [PATCH 1/1] rpi-firmware: bump to latest version
In-Reply-To: <20170913101909.18352-1-mahyar.koshkouei@gmail.com>
References: <20170913101909.18352-1-mahyar.koshkouei@gmail.com>
Message-ID: <c1454ad3-6995-7413-0fee-c66ff52bea60@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-09-17 12:19, Mahyar Koshkouei wrote:
> Signed-off-by: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/rpi-firmware/rpi-firmware.hash | 2 +-
>  package/rpi-firmware/rpi-firmware.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
> index db26c1e9c4..833a7fbe37 100644
> --- a/package/rpi-firmware/rpi-firmware.hash
> +++ b/package/rpi-firmware/rpi-firmware.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256 42edea8317869f5a5ed87dfe009ceffce6a784ff40cb5da3e9e8a4fc61d79610 rpi-firmware-685b3ceb0a6d6d6da7b028ee409850e83fb7ede7.tar.gz
> +sha256 0451e1a843bf02df81126a1625d9a15dfdf19dcb2f9e95b0613a63e59fd31ca8 rpi-firmware-2067241bc7cdf238fdeab7f5a3c22faa57dd5617.tar.gz
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index 10da04b935..22eaaa2886 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RPI_FIRMWARE_VERSION = 685b3ceb0a6d6d6da7b028ee409850e83fb7ede7
> +RPI_FIRMWARE_VERSION = 2067241bc7cdf238fdeab7f5a3c22faa57dd5617
>  RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
>  RPI_FIRMWARE_LICENSE = BSD-3-Clause
>  RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
