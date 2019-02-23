From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Feb 2019 16:36:53 +0100
Subject: [Buildroot] [PATCH/next v3 6/6] configs/freescale_imx8qxpmek:
 New defconfig
In-Reply-To: <20190218204807.16815-7-nerv@dawncrow.de>
References: <20190218204807.16815-1-nerv@dawncrow.de>
 <20190218204807.16815-7-nerv@dawncrow.de>
Message-ID: <20190223163653.610e981f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Feb 2019 21:48:07 +0100
Andr? Hentschel <nerv@dawncrow.de> wrote:

> From: Andr? Hentschel <andre.hentschel@zf.com>
> 
> Signed-off-by: Andr? Hentschel <andre.hentschel@zf.com>
> ---
>  .gitlab-ci.yml                         |  1 +
>  board/freescale/imx8qxpmek/readme.txt  | 67 ++++++++++++++++++++++++++
>  configs/freescale_imx8qxpmek_defconfig | 40 +++++++++++++++
>  3 files changed, 108 insertions(+)
>  create mode 100644 board/freescale/imx8qxpmek/readme.txt
>  create mode 100644 configs/freescale_imx8qxpmek_defconfig

You forgot to update the DEVELOPERS file, so I've done that and applied
to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
