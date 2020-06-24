From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 24 Jun 2020 16:57:09 -0300
Subject: [Buildroot] [PATCH 2/2] package/freescale-imx/firmware-imx:
 Clean up the image/target semantic
In-Reply-To: <1593012228-18959-3-git-send-email-stephane.viau@oss.nxp.com>
References: <1593012228-18959-1-git-send-email-stephane.viau@oss.nxp.com>
 <1593012228-18959-3-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <CAOMZO5AiPKpTDnwDo8KWriwWawq+YFSgjTiw8xJscdG+YvkijQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stephane,

On Wed, Jun 24, 2020 at 12:39 PM Stephane Viau
<stephane.viau@oss.nxp.com> wrote:
>
> The newly introduced BR2_PACKAGE_FREESCALE_IMX_NEED_xxx_FW symbols shall
> be used in lieue of the SoC type when installing images or binaries on
> target.
>
> These new symbols let us define FIRMWARE_IMX_INSTALL_IMAGES_CMDS and
> FIRMWARE_IMX_INSTALL_TARGET_CMDS based on platform needs rather than
> SoC type.
>
> Suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>

This looks like a nice solution, thanks:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
