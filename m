From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 14:22:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/imx-sc-firmware: bump to
 version 1.2.1
In-Reply-To: <20191218130429.847805-1-juju@cotds.org>
References: <20191218130429.847805-1-juju@cotds.org>
Message-ID: <20191222142249.7fa3ad25@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 18 Dec 2019 14:04:29 +0100
Julien Olivain <juju@cotds.org> wrote:

> This version is aligned with i.MX NXP BSP components version
> rel_imx_4.14.98_2.0.0_ga
> 
> This patch also add the hash file.
> 
> Signed-off-by: Julien Olivain <juju@cotds.org>
> ---
>  package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash | 4 ++++
>  package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk   | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)
>  create mode 100644 package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
