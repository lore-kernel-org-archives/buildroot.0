From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Sep 2016 23:19:38 +0200
Subject: [Buildroot] [PATCH 1/4] configs/imx6qsabreauto: Use zImage by
 default
In-Reply-To: <1474634837-5756-1-git-send-email-festevam@gmail.com>
References: <1474634837-5756-1-git-send-email-festevam@gmail.com>
Message-ID: <20160925231938.2009aecb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Sep 2016 09:47:14 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Currently the generated sdcard.img does not boot because U-Boot looks for
> a zImage type of kernel instead of uImage.
> 
> Remove the generation of uImage, so that the sdcard.img can successfully
> boot.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  configs/freescale_imx6qsabreauto_defconfig | 2 --
>  1 file changed, 2 deletions(-)

All four patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
