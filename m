From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 14:00:17 +0200
Subject: [Buildroot] [PATCH] board: solidrun: add Clearfog GT-8K
In-Reply-To: <0131577d7afceede1aa59bf7b98dc3bda9249df5.1560673127.git.baruch@tkos.co.il>
References: <0131577d7afceede1aa59bf7b98dc3bda9249df5.1560673127.git.baruch@tkos.co.il>
Message-ID: <20190619140017.5d05b896@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 16 Jun 2019 11:18:47 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> Add support for the SolidRun Armada 8040 based Clearfog GT-8K. This
> board has the same processor as the Macchiatobin, so we can reuse the
> Macchiatobin U-Boot and image definitions.
> 
> The kernel fragment enables drivers that are necessary to make
> networking ports work (SFP, Ethernet port, and Ethernet switch).
> 
> Cc: Jan Kundr?t <jan.kundrat@cesnet.cz>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  DEVELOPERS                                    |  2 +
>  board/solidrun/clearfog_gt_8k/extlinux.conf   |  4 ++
>  board/solidrun/clearfog_gt_8k/genimage.cfg    |  1 +
>  .../clearfog_gt_8k/linux-extras.config        |  4 ++
>  .../clearfog_gt_8k/post-build-mainline.sh     |  1 +
>  board/solidrun/clearfog_gt_8k/readme.txt      | 61 +++++++++++++++++++
>  .../clearfog_gt_8k/uboot-fragment.config      |  1 +
>  configs/solidrun_clearfog_gt_8k_defconfig     | 46 ++++++++++++++
>  8 files changed, 120 insertions(+)
>  create mode 100644 board/solidrun/clearfog_gt_8k/extlinux.conf
>  create mode 120000 board/solidrun/clearfog_gt_8k/genimage.cfg
>  create mode 100644 board/solidrun/clearfog_gt_8k/linux-extras.config
>  create mode 120000 board/solidrun/clearfog_gt_8k/post-build-mainline.sh
>  create mode 100644 board/solidrun/clearfog_gt_8k/readme.txt
>  create mode 120000 board/solidrun/clearfog_gt_8k/uboot-fragment.config
>  create mode 100644 configs/solidrun_clearfog_gt_8k_defconfig

Thanks Baruch for the feedback on my questions, it answered all of
them, so I've applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
