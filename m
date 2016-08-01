From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Aug 2016 22:11:25 +0200
Subject: [Buildroot] [PATCH] configs: imx6ulpico: Add Wifi support
In-Reply-To: <1470065231-24956-1-git-send-email-festevam@gmail.com>
References: <1470065231-24956-1-git-send-email-festevam@gmail.com>
Message-ID: <20160801221125.63513644@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  1 Aug 2016 12:27:11 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> imx6ulpico has a BCM4339 Wifi chip. Add Wifi support by default
> to allow a better customer experience.
> 
> The dts patch has already been sent to the linux-arm-kernel list
> and we can remove it once it reaches a mainline kernel (in 
> version 4.9 probably).
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  board/technexion/imx6ulpico/linux.fragment         |   1 +
>  .../imx6ulpico/patches/linux/0001-picowifi.patch   |  67 ++++++++++++++
>  board/technexion/imx6ulpico/readme.txt             |  11 +++
>  .../lib/firmware/brcm/brcmfmac4339-sdio.txt        | 102 +++++++++++++++++++++
>  configs/imx6ulpico_defconfig                       |  16 ++++
>  5 files changed, 197 insertions(+)
>  create mode 100644 board/technexion/imx6ulpico/linux.fragment
>  create mode 100644 board/technexion/imx6ulpico/patches/linux/0001-picowifi.patch
>  create mode 100644 board/technexion/imx6ulpico/rootfs_overlay/lib/firmware/brcm/brcmfmac4339-sdio.txt

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
