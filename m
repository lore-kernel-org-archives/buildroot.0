From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 24 Jun 2020 17:11:27 -0300
Subject: [Buildroot] [PATCH 1/2] package/freescale-imx: Add option for
 all i.MX FW needs
In-Reply-To: <1593012228-18959-2-git-send-email-stephane.viau@oss.nxp.com>
References: <1593012228-18959-1-git-send-email-stephane.viau@oss.nxp.com>
 <1593012228-18959-2-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <CAOMZO5Bw4O+mDhVB1x2itxW3pXqdRW=-yU9SCucS0bsa-RhLUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stephane,

Forgot to add one more comment:

On Wed, Jun 24, 2020 at 12:57 PM Stephane Viau
<stephane.viau@oss.nxp.com> wrote:

> +config BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY

Should we name this after the VPU IP name instead? Something like this:

BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_CODA

> +config BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_IMX8_IMX8X

BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_MALONE
