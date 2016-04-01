From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 1 Apr 2016 09:22:45 +0300
Subject: [Buildroot] [PATCH] wilc1000-firmware: new package
In-Reply-To: <1459491576-32280-1-git-send-email-ludovic.desroches@atmel.com>
References: <1459491576-32280-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <20160401062245.GA2406@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ludovic,

On Fri, Apr 01, 2016 at 08:19:36AM +0200, Ludovic Desroches wrote:
> diff --git a/package/wilc1000-firmware/wilc1000-firmware.mk 
> b/package/wilc1000-firmware/wilc1000-firmware.mk
> new file mode 100644
> index 0000000..a3ec86f
> --- /dev/null
> +++ b/package/wilc1000-firmware/wilc1000-firmware.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# wilc1000-firmware
> +#
> +################################################################################
> +
> +WILC1000_FIRMWARE_VERSION = 14.1
> +WILC1000_FIRMWARE_SITE = https://github.com/linux4sc/wireless-firmware/archive
> +WILC1000_FIRMWARE_SOURCE = v$(WILC1000_FIRMWARE_VERSION)_Firmware.zip
> +WILC1000_FIRMWARE_DRIVER_FILE = wilc1003_firmware.bin
> +
> +WILC1000_FIRMWARE_LICENSE = PROPRIETARY

No LICENSE_FILES? Is it distributable? I would guess it is, but we have no 
indication.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
