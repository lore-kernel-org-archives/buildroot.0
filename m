From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 23:08:16 +0200
Subject: [Buildroot] [PATCH 2/2] configs/macchiatobin: drop marvell
 defconfig
In-Reply-To: <20200415134136.580543-3-geomatsi@gmail.com>
References: <20200415134136.580543-1-geomatsi@gmail.com>
 <20200415134136.580543-3-geomatsi@gmail.com>
Message-ID: <20200415230816.7cf04186@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Apr 2020 16:41:36 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> Support for MacchiatoBin board in U-Boot and Linux has been significantly
> improved during the last several years. So there is not much sense in
> having a separate build configuration based on older vendor Linux kernel
> and U-Boot. Drop marvell config and rename mainline config.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>  DEVELOPERS                                    |  3 +-
>  board/solidrun/macchiatobin/readme.txt        | 44 ++++++-------------
>  ...config => solidrun_macchiatobin_defconfig} |  0
>  .../solidrun_macchiatobin_marvell_defconfig   | 44 -------------------
>  4 files changed, 15 insertions(+), 76 deletions(-)
>  rename configs/{solidrun_macchiatobin_mainline_defconfig => solidrun_macchiatobin_defconfig} (100%)
>  delete mode 100644 configs/solidrun_macchiatobin_marvell_defconfig

I have slightly reworded the commit log, regenerated the .gitlab-ci.yml
file and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
