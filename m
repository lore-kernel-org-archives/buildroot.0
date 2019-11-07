From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Nov 2019 22:45:28 +0100
Subject: [Buildroot] [PATCH v2 1/5] configs/raspberrypi*: bump kernel
 version to 1.20190925-1
In-Reply-To: <20191107202339.6371-1-ps.report@gmx.net>
References: <20191107202339.6371-1-ps.report@gmx.net>
Message-ID: <20191107224528.003ac7ca@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  7 Nov 2019 21:23:35 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Now based on 4.19.75 (from 4.19.66).
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>  - revert of accidantal remove of rpi-userland vcfiled files
>    (suggested by Baruch Siach)
> ---
>  configs/raspberrypi0_defconfig       | 2 +-
>  configs/raspberrypi0w_defconfig      | 2 +-
>  configs/raspberrypi2_defconfig       | 2 +-
>  configs/raspberrypi3_64_defconfig    | 2 +-
>  configs/raspberrypi3_defconfig       | 2 +-
>  configs/raspberrypi3_qt5we_defconfig | 2 +-
>  configs/raspberrypi4_defconfig       | 2 +-
>  configs/raspberrypi_defconfig        | 2 +-
>  8 files changed, 8 insertions(+), 8 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
