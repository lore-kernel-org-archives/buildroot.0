From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 12:36:29 +0200
Subject: [Buildroot] [PATCH] configs/warp7: Use common script for
 generating boot image
In-Reply-To: <1475173004-24091-1-git-send-email-fabio.estevam@nxp.com>
References: <1475173004-24091-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <20161025123629.22488ea6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 29 Sep 2016 15:16:44 -0300, Fabio Estevam wrote:
> Use the common board/freescale/common/post-image.sh script instead of
> a custom one.
> 
> As the final image binary is called "sdcard.img" update the documentation
> accordingly.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  board/warp7/genimage.cfg  | 41 -----------------------------------------
>  board/warp7/post-image.sh | 14 --------------
>  board/warp7/readme.txt    |  8 ++++----
>  configs/warp7_defconfig   |  2 +-
>  4 files changed, 5 insertions(+), 60 deletions(-)
>  delete mode 100644 board/warp7/genimage.cfg
>  delete mode 100755 board/warp7/post-image.sh

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
