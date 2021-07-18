From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 22:15:59 +0200
Subject: [Buildroot] [PATCH v2 3/4] configs/beaglev: update U-Boot to
 enable OF_SEPARATE
In-Reply-To: <20210616050341.510702-4-drew@beagleboard.org>
References: <20210616050341.510702-1-drew@beagleboard.org>
 <20210616050341.510702-4-drew@beagleboard.org>
Message-ID: <20210718221559.3d343c13@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 15 Jun 2021 22:03:43 -0700
Drew Fustini <drew@beagleboard.org> wrote:

> Update commit ID of U-Boot to latest commit in starfive-tech repo [1]
> which enables OF_SEPARATE [2].
> 
> [1] https://github.com/starfive-tech/u-boot/tree/Fedora_VIC_7100_2021.04
> [2] https://github.com/starfive-tech/u-boot/commit/64ead5b83959da8eb87b6963843addf5942e6ed4
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
>  configs/beaglev_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
