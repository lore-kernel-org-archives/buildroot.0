From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Tue, 14 Oct 2014 11:25:59 +0200
Subject: [Buildroot] [PATCH 2/2] Change deps between $(TARGET_DIRS) and
	rootfs-dirs
In-Reply-To: <1413278627-8063-2-git-send-email-jezz@sysmic.org>
References: <1413278627-8063-1-git-send-email-jezz@sysmic.org>
 <1413278627-8063-2-git-send-email-jezz@sysmic.org>
Message-ID: <CABbD_XC3-Fm7Fzro_rkN5RRD17=TUJeFCd7dBMkr9LKQrAYs4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 14, 2014 at 11:23 AM, J?r?me Pouiller <jezz@sysmic.org> wrote:

> --- a/toolchain/toolchain-buildroot/toolchain-buildroot.mk
> +++ b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
> @@ -10,7 +10,7 @@ BR_LIBC = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_LIBC))
>  # build of binutils, uClibc, kernel headers and all the intermediate
>  # gcc steps.
>
> -TOOLCHAIN_BUILDROOT_DEPENDENCIES = host-gcc-final
> +TOOLCHAIN_BUILDROOT_DEPENDENCIES = host-gcc-final tootfs-dirs
>

I think that should be "rootfs-dirs"?

BR,
KK
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141014/7fa361b5/attachment.html>
