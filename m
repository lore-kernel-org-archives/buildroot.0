From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 May 2020 15:54:55 +0200
Subject: [Buildroot] [PATCH 00/22] linux: allow packages to set kconfig
 options (branch yem/pkg-linux-opts)
In-Reply-To: <cover.1586002215.git.yann.morin.1998@free.fr>
References: <cover.1586002215.git.yann.morin.1998@free.fr>
Message-ID: <20200501155455.4b8e47a4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  4 Apr 2020 14:10:30 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Yann E. MORIN (22):
>       core/pkg-utils: rationalise kconfig option mangling
>       core/pkg-utils: kconfig mangling defaults to current package's .config
>       boot/barebox: don't specify .config to munge
>       boot/uboot: don't specify .config to munge
>       boot/busybox: don't specify .config to munge
>       boot/swupdate: don't specify .config to munge
>       boot/uclibc: don't specify .config to munge
>       linux: don't specify .config to munge
>       linux: allow packages to set options
>       package/audit: bear the kernel options munging
>       package/intel-micro-code: bear the kernel options munging
>       package/ktap: bear the kernel options munging
>       package/pcm-tools: bear the kernel options munging
>       package/linux-tools/perf: bear the kernel options munging
>       package/systemd: bear the kernel options munging
>       package/smack: bear the kernel options munging
>       package/sunxi-mali-mainline-driver: bear the kernel options munging
>       package/iptables: bear the kernel options munging
>       package/xtables-addons: bear the kernel options munging
>       package/wireguard-linux-compat: bear the kernel options munging
>       package/libselinux: bear the kernel options munging
>       package/kernel-module-imx-gpu-viv: bear the kernel options munging

I've applied the entire series, except the package/linux-tools/perf
change. I'll reply to it, and to some other patches individually.

I also added one more commit to convert libapparmor to use this
mechanism.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
