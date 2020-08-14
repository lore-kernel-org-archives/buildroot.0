From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 14 Aug 2020 23:19:45 +0200
Subject: [Buildroot] [PATCH 1/1] configs/qemu_*: bump kernel version to
 5.4.58
In-Reply-To: <1597407588-20890-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1597407588-20890-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <20200814231945.5fd490ca@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 14 Aug 2020 14:19:48 +0200
Jugurtha BELKALEM <jugurtha.belkalem@smile.fr> wrote:

> Bump configs/qemu_* to latest longterm kernel 5.4.42.
> 
> All defconfig using a specific kernel version (csky, risc32) are not
> taken into account.
> 
> Build and runtime tested: https://gitlab.com/jugurthaB/buildroot/-/pipelines/177882458
> 
> Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> ---
>  configs/qemu_aarch64_virt_defconfig        | 2 +-
>  configs/qemu_arm_versatile_defconfig       | 2 +-
>  configs/qemu_arm_versatile_nommu_defconfig | 2 +-
>  configs/qemu_arm_vexpress_defconfig        | 2 +-
>  configs/qemu_arm_vexpress_tz_defconfig     | 2 +-
>  configs/qemu_m68k_mcf5208_defconfig        | 2 +-
>  configs/qemu_m68k_q800_defconfig           | 2 +-
>  configs/qemu_microblazebe_mmu_defconfig    | 2 +-
>  configs/qemu_microblazeel_mmu_defconfig    | 2 +-
>  configs/qemu_mips32r2_malta_defconfig      | 2 +-
>  configs/qemu_mips32r2el_malta_defconfig    | 2 +-
>  configs/qemu_mips32r6_malta_defconfig      | 2 +-
>  configs/qemu_mips32r6el_malta_defconfig    | 2 +-
>  configs/qemu_mips64el_malta_defconfig      | 2 +-
>  configs/qemu_mips64r6_malta_defconfig      | 2 +-
>  configs/qemu_mips64r6el_malta_defconfig    | 2 +-
>  configs/qemu_nios2_10m50_defconfig         | 2 +-
>  configs/qemu_or1k_defconfig                | 2 +-
>  configs/qemu_ppc64_e5500_defconfig         | 2 +-
>  configs/qemu_ppc64_pseries_defconfig       | 2 +-
>  configs/qemu_ppc64le_pseries_defconfig     | 2 +-
>  configs/qemu_ppc_g3beige_defconfig         | 2 +-
>  configs/qemu_ppc_mac99_defconfig           | 2 +-
>  configs/qemu_ppc_mpc8544ds_defconfig       | 2 +-
>  configs/qemu_ppc_virtex_ml507_defconfig    | 2 +-
>  configs/qemu_riscv64_virt_defconfig        | 2 +-
>  configs/qemu_sh4_r2d_defconfig             | 2 +-
>  configs/qemu_sh4eb_r2d_defconfig           | 2 +-
>  configs/qemu_sparc64_sun4u_defconfig       | 2 +-
>  configs/qemu_sparc_ss10_defconfig          | 2 +-
>  configs/qemu_x86_64_defconfig              | 2 +-
>  configs/qemu_x86_defconfig                 | 2 +-
>  configs/qemu_xtensa_lx60_defconfig         | 2 +-
>  configs/qemu_xtensa_lx60_nommu_defconfig   | 2 +-
>  34 files changed, 34 insertions(+), 34 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
