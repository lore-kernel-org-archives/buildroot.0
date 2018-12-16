From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 16:00:37 +0100
Subject: [Buildroot] [PATCH 4/4] board: orangepi: lite2: Add WiFi support
In-Reply-To: <20181103125608.2255-4-jagan@amarulasolutions.com>
References: <20181103125608.2255-1-jagan@amarulasolutions.com>
 <20181103125608.2255-4-jagan@amarulasolutions.com>
Message-ID: <20181216160037.1150c27e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Nov 2018 18:26:08 +0530, Jagan Teki wrote:
> Orangepi lite2 board has AP6356S WiFi/BT combo, but does
> not have ethernet port. So it makes sense to enable wireless
> networking by default:
> - add broadcom wireless firmware package to image
> - add basic wireless tools to image
> - add rootfs overlay with proper NVRAM file for on-board AP6356S chip
> - add mdev to image to enable module autoloading
> - update readme.txt to test wifi
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  board/orangepi/orangepi-lite2/readme.txt      |  9 ++
>  .../lib/firmware/brcm/brcmfmac43455-sdio.txt  | 82 +++++++++++++++++++
>  configs/orangepi_lite2_defconfig              | 13 +++
>  3 files changed, 104 insertions(+)
>  create mode 100755 board/orangepi/orangepi-lite2/rootfs_overlay/lib/firmware/brcm/brcmfmac43455-sdio.txt

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
