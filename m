From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 21:58:05 +0200
Subject: [Buildroot] [PATCH v2 1/1] board: resurrect support for
 RIoTboard
In-Reply-To: <20180908002452.11011-1-nikolay.dimitrov@retrohub.org>
References: <20180908002452.11011-1-nikolay.dimitrov@retrohub.org>
Message-ID: <20180910215805.70aeb9ed@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  8 Sep 2018 03:24:52 +0300, Nikolay Dimitrov wrote:
> Resurrect support for RIoTboard after 2018.02.x deprecation.
> 
> Signed-off-by: Nikolay Dimitrov <nikolay.dimitrov@retrohub.org>
> ---
> Changes v1 -> v2:
>  - Add board's manufacturer website for more info
>  - Switch to genimage sdcard image generation, update install steps in
>    readme.txt
>  - Switch from uImage to zImage
>  - Switch rootfs to BR2_TARGET_ROOTFS_EXT2_4
>  - Update u-boot to v2018.07
>  - Update kernel to v4.18
>  - Add myself in DEVELOPERS for riotboard
> ---
>  DEVELOPERS                                         |  4 +++
>  board/embest/riotboard/genimage.cfg                | 17 +++++++++
>  board/embest/riotboard/readme.txt                  | 34 ++++++++++++++++++
>  .../rootfs_overlay/boot/extlinux/extlinux.conf     |  6 ++++
>  configs/riotboard_defconfig                        | 41 ++++++++++++++++++++++
>  5 files changed, 102 insertions(+)
>  create mode 100644 board/embest/riotboard/genimage.cfg
>  create mode 100644 board/embest/riotboard/readme.txt
>  create mode 100644 board/embest/riotboard/rootfs_overlay/boot/extlinux/extlinux.conf
>  create mode 100644 configs/riotboard_defconfig

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
