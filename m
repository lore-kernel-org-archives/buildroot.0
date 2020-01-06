From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Jan 2020 18:58:17 +0100
Subject: [Buildroot] [PATCH 2/2] configs/raspberrypi0w_defconfig: fix
 post script args
In-Reply-To: <20200103003752.140-2-chrismcc@gmail.com>
References: <20200103003752.140-1-chrismcc@gmail.com>
 <20200103003752.140-2-chrismcc@gmail.com>
Message-ID: <20200106175817.GE2721@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christopher, All,

On 2020-01-03 00:37 +0000, Christopher McCrory spake thusly:
> Commit ada40afb324 updated the raspberrypi*defconfigs to use
>  -add-miniuart-bt-overlay instead of -add-pi3-miniuart-bt-overlay.
> Update raspberrypi0w_defconfig also.
> 
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  configs/raspberrypi0w_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
> index ea5856e8c0..e3c747ff6f 100644
> --- a/configs/raspberrypi0w_defconfig
> +++ b/configs/raspberrypi0w_defconfig
> @@ -29,4 +29,4 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi0w/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi0w/post-image.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay"
> -- 
> 2.18.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
