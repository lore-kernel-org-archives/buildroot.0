From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Jun 2020 23:06:42 +0200
Subject: [Buildroot] [PATCH for-next] configs/qemu_*: bump kernel
 version to 5.4.42
In-Reply-To: <20200521204514.2868835-1-romain.naour@gmail.com>
References: <20200521204514.2868835-1-romain.naour@gmail.com>
Message-ID: <20200624230642.17d20249@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 21 May 2020 22:45:14 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> In order to allow testing gcc 10 using those defconfig, bump to kernel 5.4.42
> since it include some patches fixing some issue introduced by gcc 10.
> 
> For example:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=10cfaa7456d70696a89d423ce1cb0fd22967773a
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=8f6a84167e8618333d84ea4143812e3e74ced7da
> 
> All defconfig using a specific kernel version (csky, risc32) are not
> taken into account.
> 
> Build and runtime tested: https://gitlab.com/kubu93/buildroot/pipelines/148390943
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
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
