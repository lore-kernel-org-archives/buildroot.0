From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Nov 2015 22:30:50 +0100
Subject: [Buildroot] [PATCH 1/2] configs/qemu: cleanup and capitalization
In-Reply-To: <1447893511-14876-1-git-send-email-gustavo@zacarias.com.ar>
References: <1447893511-14876-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151119223050.6a33d8d7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 18 Nov 2015 21:38:30 -0300, Gustavo Zacarias wrote:
> Capitalize comments in a consistent way.
> Cleanup redundant entries.
> Drop global patch dir for sparc ss10 since it's not required any more.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  configs/qemu_arm_nuri_defconfig      | 2 --
>  configs/qemu_arm_versatile_defconfig | 5 ++---
>  configs/qemu_arm_vexpress_defconfig  | 2 --
>  configs/qemu_mips_malta_defconfig    | 2 +-
>  configs/qemu_mipsel_malta_defconfig  | 2 +-
>  configs/qemu_ppc64_pseries_defconfig | 1 -
>  configs/qemu_ppc_g3beige_defconfig   | 2 +-
>  configs/qemu_ppc_mpc8544ds_defconfig | 2 +-
>  configs/qemu_sh4_r2d_defconfig       | 5 ++---
>  configs/qemu_sh4eb_r2d_defconfig     | 5 ++---
>  configs/qemu_sparc64_sun4u_defconfig | 2 +-
>  configs/qemu_sparc_ss10_defconfig    | 4 +---
>  configs/qemu_x86_64_defconfig        | 5 ++---
>  configs/qemu_x86_defconfig           | 5 ++---
>  configs/qemu_xtensa_lx60_defconfig   | 1 +
>  15 files changed, 17 insertions(+), 28 deletions(-)

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
