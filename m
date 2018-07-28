From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Jul 2018 19:38:37 +0200
Subject: [Buildroot] [PATCH v5 2/3] configs/zynqmp_zcu106_defconfig: add
 Xilinx ZCU106 board (ZynqMP SoC)
In-Reply-To: <20180725143538.25268-3-luca@lucaceresoli.net>
References: <20180725143538.25268-1-luca@lucaceresoli.net>
 <20180725143538.25268-3-luca@lucaceresoli.net>
Message-ID: <20180728193837.34256b0b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 Jul 2018 16:35:37 +0200, Luca Ceresoli wrote:
> This adds support the Xilinx ZCU106 development board.
> 
> [Tested on the ES2 (Engineering Sample 2) version of the board]
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Joel Carlson <joelsoncarl@gmail.com>

I've applied. Just two minor nits below.

>  DEVELOPERS                                    |   2 +
>  board/zynqmp/genimage.cfg                     |  28 +++++
>  ...64-zynqmp-zcu106-fix-SPL-MMC-booting.patch |  52 ++++++++
>  ...2-arm64-zynqmp-Enable-booting-to-ATF.patch | 114 ++++++++++++++++++
>  board/zynqmp/post-image.sh                    |  13 ++
>  board/zynqmp/readme.txt                       |  51 ++++++++
>  configs/zynqmp_zcu106_defconfig               |  34 ++++++

I've regenerated the .gitlab-ci.yml file.


> +Subject: [PATCH 1/2] arm64: zynqmp: zcu106: fix SPL MMC booting

The [PATCH 1/2] should have been just [PATCH].

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
