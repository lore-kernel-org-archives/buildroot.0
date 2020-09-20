From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 15:51:41 +0200
Subject: [Buildroot] [PATCH v2 1/3] configs/raspberrypi*: bump kernel
 version to 9a1dd17 (5.4.61)
In-Reply-To: <20200910172627.8160-1-ps.report@gmx.net>
References: <20200910172627.8160-1-ps.report@gmx.net>
Message-ID: <20200920155141.505ac461@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 10 Sep 2020 19:26:25 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> From: Marcin Niestroj <m.niestroj@grinn-global.com>
> 
> Now based on 5.4.61 (from 5.4.51)
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - no changes
> ---
>  configs/raspberrypi0_defconfig       | 2 +-
>  configs/raspberrypi0w_defconfig      | 2 +-
>  configs/raspberrypi2_defconfig       | 2 +-
>  configs/raspberrypi3_64_defconfig    | 2 +-
>  configs/raspberrypi3_defconfig       | 2 +-
>  configs/raspberrypi3_qt5we_defconfig | 2 +-
>  configs/raspberrypi4_64_defconfig    | 2 +-
>  configs/raspberrypi4_defconfig       | 2 +-
>  configs/raspberrypi_defconfig        | 2 +-
>  9 files changed, 9 insertions(+), 9 deletions(-)

Thanks, series applied.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
