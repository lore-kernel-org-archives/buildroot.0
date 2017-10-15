From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Oct 2017 15:54:09 +0200
Subject: [Buildroot] [PATCH] configs/mx6udoo: Bump kernel and U-Boot
 versions
In-Reply-To: <1507932076-19487-1-git-send-email-festevam@gmail.com>
References: <1507932076-19487-1-git-send-email-festevam@gmail.com>
Message-ID: <20171015155409.7a798e97@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 Oct 2017 19:01:16 -0300, Fabio Estevam wrote:
> Bump the kernel to version 4.13.5 and U-Boot to 2017.09.
> 
> While at it, remove the custom scripts for generating the SD card image
> and use the standard scripts instead.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  board/udoo/mx6qdl/genimage.cfg  | 48 -----------------------------------------
>  board/udoo/mx6qdl/post-image.sh | 14 ------------
>  configs/mx6udoo_defconfig       | 10 ++++-----
>  3 files changed, 5 insertions(+), 67 deletions(-)
>  delete mode 100644 board/udoo/mx6qdl/genimage.cfg
>  delete mode 100755 board/udoo/mx6qdl/post-image.sh

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
