From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 24 Jun 2020 16:54:51 -0300
Subject: [Buildroot] [PATCH 1/2] package/freescale-imx: Add option for
 all i.MX FW needs
In-Reply-To: <1593012228-18959-2-git-send-email-stephane.viau@oss.nxp.com>
References: <1593012228-18959-1-git-send-email-stephane.viau@oss.nxp.com>
 <1593012228-18959-2-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <CAOMZO5BCPWzZjnCZKaO20QS8LvJ39yuxUB1OxtKd3=u_qzEBFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stephane,

On Wed, Jun 24, 2020 at 12:57 PM Stephane Viau
<stephane.viau@oss.nxp.com> wrote:

>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S
>         bool "imx6sl/imx6sx"
> +       select BR2_PACKAGE_FREESCALE_IMX_NEED_EPDC_FW
> +       select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> +       select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY

There is no VPU on i.MX6SL/i.MX6SX.

>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
>         bool "imx6ul/imx6ull"
> +       select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> +       select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY

There is no VPU on i.MX6UL/i.MX6ULL.

>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
>         bool "imx7d/imx7ulp"
> +       select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> +       select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY

There is no VPU on i.MX7.
