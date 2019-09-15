From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 14:56:22 +0200
Subject: [Buildroot] [PATCH 1/2] configs/raspberrypi0w: fix dts file
 name after kernel bump
In-Reply-To: <20190914120530.16829-1-peter@korsgaard.com>
References: <20190914120530.16829-1-peter@korsgaard.com>
Message-ID: <20190915145622.65de4967@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 14 Sep 2019 14:05:28 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes #12816
> 
> Commit 42d22f3bdba41da ({configs/raspberrypi,package/rpi-firmware}: bump
> kernel/firmware to 20190819 version) updated the kernel version but failed
> to take into consideration that the rpi0w dts file has been renamed:
> 
> https://github.com/raspberrypi/linux/commit/6f91b5dbfdb62a434571a73f2dc15181963e3bea
> 
> Fix it by renaming the dts/dtb file referenced from the kernel build and
> genimage.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  board/raspberrypi/genimage-raspberrypi0w.cfg | 2 +-
>  configs/raspberrypi0w_defconfig              | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
