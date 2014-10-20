From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Oct 2014 19:54:58 +0200
Subject: [Buildroot] [PATCH] configs/qemu-ppc-virtex-ml507: remove stray
 qemu-system entries
In-Reply-To: <1413805315-17234-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413805315-17234-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141020175458.GK3742@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-10-20 08:41 -0300, Gustavo Zacarias spake thusly:
> Removed unused config entries that sneaked in from commit
> a8956b2b53cad04ddcb56f3d3e2dcf8f6051c77a
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  configs/qemu_ppc_virtex_ml507_defconfig | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
> index bd7ab5c..b6cea31 100644
> --- a/configs/qemu_ppc_virtex_ml507_defconfig
> +++ b/configs/qemu_ppc_virtex_ml507_defconfig
> @@ -22,8 +22,3 @@ BR2_LINUX_KERNEL_DEFCONFIG="44x/virtex5"
>  BR2_LINUX_KERNEL_VMLINUX=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="virtex440-ml507"
> -
> -# Qemu
> -BR2_PACKAGE_HOST_QEMU_SYSTEM=y
> -BR2_PACKAGE_HOST_QEMU_SYSTEM_VERSION="2.1.2"
> -BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M virtex-ml507 -kernel output/images/vmlinux -m 256 -append 'console=ttyS0' -display none -nographic -dtb output/images/virtex440-ml507.dtb"
> -- 
> 2.0.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
