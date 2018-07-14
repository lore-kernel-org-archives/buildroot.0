From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 14 Jul 2018 13:31:02 -0300
Subject: [Buildroot] [PATCH v2 1/2] imx/post-image: Allow flashing
 u-boot-dtb.imx in the SD card
In-Reply-To: <1531084579-7949-1-git-send-email-festevam@gmail.com>
References: <1531084579-7949-1-git-send-email-festevam@gmail.com>
Message-ID: <CAOMZO5CMZxXcDb0h0_JZaxK_Ar96mo=GuxUcDsURqh-veJd2vQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Sun, Jul 8, 2018 at 6:16 PM, Fabio Estevam <festevam@gmail.com> wrote:
> Add support for flashing the u-boot-dtb.imx binary in the SD card
> when a target selects BR2_TARGET_UBOOT_FORMAT_DTB_IMX.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Use a UBOOTBIN variable to decide the U-Boot binary name instead
> of creating a new genimage.cfg variant. (Thanks to Arnout!)

Are you happy with this version?

Thanks
