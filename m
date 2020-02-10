From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 Feb 2020 02:31:32 +0000
Subject: [Buildroot] [PATCH v4 2/9] configs/qemu_pcc_mac99: build
 host-qemu for runtime testing
In-Reply-To: <20200209180327.455426-3-romain.naour@smile.fr>
References: <20200209180327.455426-1-romain.naour@smile.fr>
 <20200209180327.455426-3-romain.naour@smile.fr>
Message-ID: <CACPK8XdrEQ_ntAC+2CtbMH5avpZKOCX_AajwoQPAHj=4zqRJoQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 9 Feb 2020 at 18:03, Romain Naour <romain.naour@smile.fr> wrote:
>
> The commit [1] added host-qemu package for each qemu defconfig
> for gitlab runtime testing.
>
> [1] 29e1cb88844614c40846540e22cf83aa9e52674f
>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Joel Stanley <joel@jms.id.au>

Acked-by: Joel Stanley <joel@jms.id.au>

> ---
>  configs/qemu_ppc_mac99_defconfig | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/configs/qemu_ppc_mac99_defconfig b/configs/qemu_ppc_mac99_defconfig
> index 4a7c7ce599..496b0fb2a4 100644
> --- a/configs/qemu_ppc_mac99_defconfig
> +++ b/configs/qemu_ppc_mac99_defconfig
> @@ -24,3 +24,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
>  BR2_TARGET_ROOTFS_CPIO=y
>  BR2_TARGET_ROOTFS_EXT2=y
>  # BR2_TARGET_ROOTFS_TAR is not set
> +
> +# host-qemu for gitlab testing
> +BR2_PACKAGE_HOST_QEMU=y
> +BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
> --
> 2.24.1
>
