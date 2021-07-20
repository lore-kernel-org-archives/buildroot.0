From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 21:47:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/armbian-firmware: add option to
 install AP6212 firmware
In-Reply-To: <20210711202729.2072853-1-clabbe@baylibre.com>
References: <20210711202729.2072853-1-clabbe@baylibre.com>
Message-ID: <20210720214739.7086fb9b@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Corentin,

On Sun, 11 Jul 2021 20:27:29 +0000
Corentin Labbe <clabbe@baylibre.com> wrote:

> This WiFi/BT chip is used on some Allwinner based boards like BananaPI M3.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

Could you try to use ./brcm/brcmfmac43430-sdio.AP6212.txt from the
official linux-firmware project instead ? (This might require an update
to the Buildroot linux-firmware package, of course).

The reason I'm suggesting this is that linux-firmware has some BCM43430
firmware, and rpi-wifi-firmware also has some BCM43430, so if we can
avoid adding a third way of getting the same firmware, it would be nice.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
