From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 15:08:59 +0200
Subject: [Buildroot] [PATCH 1/3] configs/qemu: bump to linux 4.6.3
In-Reply-To: <1467459937-11712-1-git-send-email-gustavo@zacarias.com.ar>
References: <1467459937-11712-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160702150859.1b16b170@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jul 2016 08:45:35 -0300, Gustavo Zacarias wrote:
> In order to keep them in sync with the new configs, and avoid shipping a
> vulnerable kernel.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  configs/qemu_arm_versatile_defconfig     | 2 +-
>  configs/qemu_arm_vexpress_defconfig      | 2 +-
>  configs/qemu_m68k_mcf5208_defconfig      | 2 +-
>  configs/qemu_m68k_q800_defconfig         | 2 +-
>  configs/qemu_microblazebe_mmu_defconfig  | 2 +-
>  configs/qemu_microblazeel_mmu_defconfig  | 2 +-
>  configs/qemu_mips32r2_malta_defconfig    | 2 +-
>  configs/qemu_mips32r2el_malta_defconfig  | 2 +-
>  configs/qemu_mips64_malta_defconfig      | 2 +-
>  configs/qemu_mips64el_malta_defconfig    | 2 +-
>  configs/qemu_ppc64_pseries_defconfig     | 2 +-
>  configs/qemu_ppc_g3beige_defconfig       | 2 +-
>  configs/qemu_ppc_mpc8544ds_defconfig     | 2 +-
>  configs/qemu_ppc_virtex_ml507_defconfig  | 2 +-
>  configs/qemu_sh4_r2d_defconfig           | 2 +-
>  configs/qemu_sh4eb_r2d_defconfig         | 2 +-
>  configs/qemu_sparc64_sun4u_defconfig     | 2 +-
>  configs/qemu_sparc_ss10_defconfig        | 2 +-
>  configs/qemu_x86_64_defconfig            | 2 +-
>  configs/qemu_x86_defconfig               | 2 +-
>  configs/qemu_xtensa_lx60_defconfig       | 2 +-
>  configs/qemu_xtensa_lx60_nommu_defconfig | 2 +-
>  22 files changed, 22 insertions(+), 22 deletions(-)

Applied all three to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
