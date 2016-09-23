From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Sep 2016 08:05:18 +0200
Subject: [Buildroot] [PATCH 1/2] configs/imx6qsabresd: Use zImage by
 default
In-Reply-To: <1474552450-29870-1-git-send-email-fabio.estevam@nxp.com>
References: <1474552450-29870-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <20160923080518.5ee4a401@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Sep 2016 10:54:09 -0300, Fabio Estevam wrote:
> Currently the generated sdcard.img does not boot because U-Boot looks for
> a zImage type of kernel instead of uImage.
> 
> Remove the generation of uImage, so that the sdcard.img can successfully
> boot.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  configs/freescale_imx6qsabresd_defconfig | 2 --
>  1 file changed, 2 deletions(-)

Both patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
