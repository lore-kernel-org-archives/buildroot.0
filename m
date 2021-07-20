From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 21:24:16 +0200
Subject: [Buildroot] [PATCH] board/olimex/a20_olinuxino: switch to
 extlinux.conf
In-Reply-To: <20210720043607.2325813-1-francois.perrad@gadz.org>
References: <20210720043607.2325813-1-francois.perrad@gadz.org>
Message-ID: <20210720212416.6945ef95@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 20 Jul 2021 06:36:07 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> a10_olinuxino is not switched, so broken links are replaced by the previous content
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  board/olimex/a10_olinuxino/boot.cmd                         | 6 +++++-
>  board/olimex/a10_olinuxino/post-build.sh                    | 4 +++-
>  board/olimex/a20_olinuxino/boot.cmd                         | 5 -----
>  board/olimex/a20_olinuxino/post-build.sh                    | 3 ---
>  .../rootfs_overlay/boot/extlinux/extlinux.conf              | 4 ++++
>  configs/olimex_a20_olinuxino_lime2_defconfig                | 4 +---
>  configs/olimex_a20_olinuxino_lime_defconfig                 | 4 +---
>  7 files changed, 14 insertions(+), 16 deletions(-)
>  mode change 120000 => 100644 board/olimex/a10_olinuxino/boot.cmd
>  mode change 120000 => 100755 board/olimex/a10_olinuxino/post-build.sh
>  delete mode 100644 board/olimex/a20_olinuxino/boot.cmd
>  delete mode 100755 board/olimex/a20_olinuxino/post-build.sh
>  create mode 100644 board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
