From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 21:58:52 +0200
Subject: [Buildroot] [PATCH 3/4] wandboard: Use U-Boot 2016.07
In-Reply-To: <1473622926-5476-3-git-send-email-festevam@gmail.com>
References: <1473622926-5476-1-git-send-email-festevam@gmail.com>
 <1473622926-5476-3-git-send-email-festevam@gmail.com>
Message-ID: <20160911215852.2cf1ed43@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Sep 2016 16:42:05 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Upgrade U-Boot version to 2016.07 and make proper use of U-Boot
> distro configuration features.
> 
> Provide a boot.scr binary script that is one of the standard ways to
> pass a U-Boot script with distro features enabled.
> 
> With this method the uboot-env.txt file is no longer needed, so it is
> removed.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  board/wandboard/boot.scr.txt  |  7 +++++++
>  board/wandboard/genimage.cfg  |  7 -------
>  board/wandboard/post-build.sh |  8 ++++++++
>  board/wandboard/uboot-env.txt | 28 ----------------------------
>  configs/wandboard_defconfig   | 10 +++-------
>  5 files changed, 18 insertions(+), 42 deletions(-)
>  create mode 100644 board/wandboard/boot.scr.txt
>  create mode 100755 board/wandboard/post-build.sh
>  delete mode 100644 board/wandboard/uboot-env.txt

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
