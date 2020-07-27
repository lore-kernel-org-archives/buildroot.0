From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 21:16:26 +0200
Subject: [Buildroot] [PATCH] package/freescale-imx/firmware-imx:
 refactor DDR firmware preparation
In-Reply-To: <20200711214239.1179211-1-thomas.petazzoni@bootlin.com>
References: <20200711214239.1179211-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200727211626.7008f7c2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Jul 2020 23:42:38 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> The logic doing the padding and concatenation of DDR firmware was
> duplicated between the DDR4 and LPDDR4 cases. This commit refactors
> this logic into a single function FIRMWARE_IMX_PREPARE_DDR_FW.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  .../firmware-imx/firmware-imx.mk              | 44 ++++++++-----------
>  1 file changed, 19 insertions(+), 25 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
