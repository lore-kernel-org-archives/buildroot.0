From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Feb 2019 16:35:09 +0100
Subject: [Buildroot] [PATCH/next v3 2/6] package/freescale-imx: Add
 imx-sc-firmware package
In-Reply-To: <20190218204807.16815-3-nerv@dawncrow.de>
References: <20190218204807.16815-1-nerv@dawncrow.de>
 <20190218204807.16815-3-nerv@dawncrow.de>
Message-ID: <20190223163509.3301713e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 18 Feb 2019 21:48:03 +0100
Andr? Hentschel <nerv@dawncrow.de> wrote:

> From: Andr? Hentschel <andre.hentschel@zf.com>
> 
> Signed-off-by: Andr? Hentschel <andre.hentschel@zf.com>
> ---
>  DEVELOPERS                                    |  1 +
>  package/freescale-imx/Config.in               |  1 +
>  .../freescale-imx/imx-sc-firmware/Config.in   |  8 ++++++
>  .../imx-sc-firmware/imx-sc-firmware.mk        | 27 +++++++++++++++++++
>  4 files changed, 37 insertions(+)
>  create mode 100644 package/freescale-imx/imx-sc-firmware/Config.in
>  create mode 100644 package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk

Applied to next after changing the commit title to:

	package/freescale-imx/imx-sc-firmware: new package

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
