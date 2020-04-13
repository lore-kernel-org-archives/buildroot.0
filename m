From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 15:53:06 +0200
Subject: [Buildroot] [PATCH v2] configs/imx6ullevk: new defconfig
 board/freescale/imx6ullevk/readme.txt: new readme for the imx6ullevk board.
 DEVELOPERS: Add myself as the maintainer of imx6ullevk.
In-Reply-To: <20190926181419.18710-1-jeffrey.kinross@i3pd.com>
References: <20190521204534.27569-1-jeffrey.kinross@i3pd.com>
 <20190926181419.18710-1-jeffrey.kinross@i3pd.com>
Message-ID: <20200413155306.78792b5f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jeffrey,

On Thu, 26 Sep 2019 13:14:20 -0500
Jeffrey Kinross <jeffrey.kinross@i3pd.com> wrote:

> Changes v1 -> v2:
>  - DEVELOPERS - Add myself as maintainer of configs/imx6ullevk (suggested by Gilles Talis)
>  - configs/imx6ullevk - Use the FSL kernel and uboot. Pin the kernel and uboot version (suggested by Thomas Petazzoni)
> 
> configs/imx6ullevk: new defconfig
> board/freescale/imx6ullevk/readme.txt: new readme for the imx6ullevk board.
> DEVELOPERS: Add myself as the maintainer of imx6ullevk.
> 
> Add support for imx6ullevk board, using the kernel and uboot from the FSL Community BSP.
> 
> Signed-off-by: Jeffrey Kinross <jeffrey.kinross@i3pd.com>

Thanks a lot for your contribution. However in the mean time, we have
merged
https://git.buildroot.org/buildroot/tree/configs/freescale_imx6ullevk_defconfig
which supports the same board, also with the NXP-provided kernel and
U-Boot.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
