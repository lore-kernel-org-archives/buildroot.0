From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 9 Apr 2018 17:46:05 -0300
Subject: [Buildroot] [PATCH v6 4/4] configs/freescale_imx8mqevk: new
 defconfig
In-Reply-To: <20180409224224.7ba2379a@windsurf>
References: <1520682702-10035-1-git-send-email-karl.erik.larsson@gmail.com>
 <1520682702-10035-5-git-send-email-karl.erik.larsson@gmail.com>
 <20180409224224.7ba2379a@windsurf>
Message-ID: <CAOMZO5Cusr6ho=F47mqaMYw6TX2_t_7+F1+yq-GxmcM4W623-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Apr 9, 2018 at 5:42 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:

> Shouldn't this logic be moved to a specialized post-image script ? And
> then you do:
>
> BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
>
> or something like that ? Fabio, what do you think ?

Looks good, thanks.
