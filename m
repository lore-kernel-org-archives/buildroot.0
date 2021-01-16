From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 22:35:47 +0100
Subject: [Buildroot] [PATCH 1/4] configs/solidrun_macchiatobin: bump BSP
 components
In-Reply-To: <20210110141629.1510597-2-geomatsi@gmail.com>
References: <20210110141629.1510597-1-geomatsi@gmail.com>
 <20210110141629.1510597-2-geomatsi@gmail.com>
Message-ID: <20210116223547.2a2cd0f4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 10 Jan 2021 17:16:26 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> Bump U-Boot and Linux kernel versions. Fix recent build failures caused
> by mv-ddr-marvell package update. Marvell ATF does not provide a version
> compatible with up-to-date mv-ddr-marvell. According to commit log,
> Marvell developers are now contributing directly to upstream ATF. So
> switch to upstream ATF instead of using older Marvell ATF versions.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/938922500
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>  configs/solidrun_macchiatobin_defconfig | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)

Thanks, series applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
