From: Stephane Viau (OSS) <stephane.viau@oss.nxp.com>
Date: Thu, 18 Mar 2021 14:01:41 +0000
Subject: [Buildroot] [PATCH 1/1] configs/freescale_imx8mpevk: new
 defconfig
In-Reply-To: <20210318135335.31898-1-stephane.viau@oss.nxp.com>
References: <20210318135335.31898-1-stephane.viau@oss.nxp.com>
Message-ID: <AM0PR04MB6946BE1F498EC348A0C373F3A7699@AM0PR04MB6946.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>This patch adds support for the NXP i.MX 8MPlus EVK board [1].                  
>                                                                                
>The final boot image is created from uboot and firmware binaries in post        
>image script board/freescale/common/imx/imx8-bootloader-prepare.sh              
>                                                                                
>This first support is based on NXP's 5.4.70_2.3.0 BSP.                          
>                                                                                
>[1] https://www.nxp.com/design/development-boards/i-mx-evaluation-and-development-boards/evaluation-kit-for-the-i-mx-8m-plus-applications-processor:8MPLUSLPD4-EVK
>                                                                                
>Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>                        
>---                                                                             

    [Stephane: tested on i.MX8MP EVK]
    Tested-by: Stephane Viau <stephane.viau@oss.nxp.com>
