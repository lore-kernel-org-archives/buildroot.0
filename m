From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 14 Jul 2015 21:23:15 +0200
Subject: [Buildroot] [PATCH] btrfs-progs: bump to version 4.1.2
In-Reply-To: <1436900784-25975-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436900784-25975-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CAGduivwmQ8VJa0sb7iHDpF7bmZLGmz3J1JzX2J4vFP6wkA24ag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Acked-by "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>

On Tue, Jul 14, 2015 at 9:06 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/btrfs-progs/btrfs-progs.hash | 2 +-
>  package/btrfs-progs/btrfs-progs.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
> index 10118cc..799c878 100644
> --- a/package/btrfs-progs/btrfs-progs.hash
> +++ b/package/btrfs-progs/btrfs-progs.hash
> @@ -1,2 +1,2 @@
>  # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
> -sha256 b7f2698fd6629a1ece1422638e776d619f41d342db4d82c29dd05a57a27001b4        btrfs-progs-v4.1.1.tar.xz
> +sha256 62db60c6a0868afb6302112cea54c756873bc30b826696b167ec03ecd61b2f12        btrfs-progs-v4.1.2.tar.xz
> diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
> index aac0257..2c3dc50 100644
> --- a/package/btrfs-progs/btrfs-progs.mk
> +++ b/package/btrfs-progs/btrfs-progs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -BTRFS_PROGS_VERSION = 4.1.1
> +BTRFS_PROGS_VERSION = 4.1.2
>  BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
>  BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
>  BTRFS_PROGS_DEPENDENCIES = host-pkgconf e2fsprogs lzo util-linux zlib
> --
> 2.3.6
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
