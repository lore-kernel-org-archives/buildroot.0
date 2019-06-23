From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 16:03:20 +0200
Subject: [Buildroot] [PATCH] boot/mv-ddr-marvell: fix build with GCC 8
In-Reply-To: <5347115f55229181585fe3229ea82f3f89698435.1561265461.git.baruch@tkos.co.il>
References: <5347115f55229181585fe3229ea82f3f89698435.1561265461.git.baruch@tkos.co.il>
Message-ID: <20190623160320.77fdc524@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 23 Jun 2019 07:51:01 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> Add upstream patch fixing a build warning that is considered as error.
> 
> Cc: Sergey Matyukevich <geomatsi@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...raining_leveling.c-uninitialized-var.patch | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 boot/mv-ddr-marvell/0001-mv_ddr-mv_ddr4_training_leveling.c-uninitialized-var.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
