From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 23 Feb 2018 11:43:31 +0100
Subject: [Buildroot] [PATCH v2 3/3] add support iMX8MQ-evk board
In-Reply-To: <1519293778-5185-4-git-send-email-karl.erik.larsson@gmail.com>
References: <1519293778-5185-1-git-send-email-karl.erik.larsson@gmail.com>
 <1519293778-5185-4-git-send-email-karl.erik.larsson@gmail.com>
Message-ID: <20180223104331.GB6998@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Erik,

On Thu, Feb 22, 2018 at 11:02:58AM +0100, Erik Larsson wrote:
> Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
> ---
>  .../common/imx/genimage.cfg.template_imx8          |  40 ++
>  board/freescale/common/imx/post-image.sh           |  10 +-
>  board/freescale/imx8mqevk/linux-4.9.config         | 625 +++++++++++++++++++++
>  configs/freescale_imx8mqevk_defconfig              |  37 ++

Why do we copy the defconfig in board folder although it present in the
kernel tree directly?

Regards,
Gary
