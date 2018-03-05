From: daggs <daggs@gmx.com>
Date: Mon, 5 Mar 2018 08:50:30 +0100
Subject: [Buildroot] Board defconfigs lacking maintainers
In-Reply-To: <20180304231547.7ed3f5af@windsurf.home>
References: <20180304231547.7ed3f5af@windsurf.home>
Message-ID: <trinity-7084c87a-b5bc-4dc4-b641-0eb7549eb0f7-1520236230212@3c-app-mailcom-bs12>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Thomas,

> Sent: Monday, March 05, 2018 at 12:15 AM
> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> To: "buildroot at uclibc.org" <buildroot@uclibc.org>
> Subject: [Buildroot] Board defconfigs lacking maintainers
>
> Hello,
> 
> A significant number of our defconfigs don't have anyone in charge of
> them according to the DEVELOPERS file.
> 
> If you are interested in one of the below defconfigs, could you please
> send an update to the DEVELOPERS file to add yourself? Defconfigs not
> associated to any developer are likely to be dropped at some point in
> the future, since they will most likely fail to build due to toolchain
> updates, and nobody will be there to fix those issues.
> 
> Here is the complete list of defconfigs that aren't associated to
> anybody in the DEVELOPERS file:
> 
>  - arcturus_ucp1020_defconfig
>  - arm_foundationv8_defconfig
>  - arm_juno_defconfig
>  - beagleboardx15_defconfig
>  - beaglebone_defconfig
>  - beaglebone_qt5_defconfig
>  - chromebook_snow_defconfig
>  - ci20_defconfig
>  - ci40_defconfig
>  - cubieboard2_defconfig
>  - firefly_rk3288_defconfig
>  - firefly_rk3288_demo_defconfig
>  - freescale_p1010rdb_pa_defconfig
>  - galileo_defconfig
>  - gdb_bfin_bf512_defconfig
>  - imx23evk_defconfig
>  - imx6-sabreauto_defconfig
>  - imx7dpico_defconfig
>  - minnowboard_max_defconfig
>  - minnowboard_max-graphical_defconfig
>  - mx25pdk_defconfig
>  - mx51evk_defconfig
>  - mx53loco_defconfig
>  - nanopi_neo_defconfig
>  - nexbox_a95x_defconfig
>  - odroidc2_defconfig
>  - olimex_imx233_olinuxino_defconfig
>  - openblocks_a6_defconfig
>  - pandaboard_defconfig
>  - qemu_aarch64_virt_defconfig
>  - qemu_arm_versatile_defconfig
>  - qemu_arm_versatile_nommu_defconfig
>  - qemu_arm_vexpress_defconfig
>  - qemu_m68k_mcf5208_defconfig
>  - qemu_m68k_q800_defconfig
>  - qemu_microblazebe_mmu_defconfig
>  - qemu_microblazeel_mmu_defconfig
>  - qemu_mips32r2el_malta_defconfig
>  - qemu_mips32r2_malta_defconfig
>  - qemu_mips32r6el_malta_defconfig
>  - qemu_mips32r6_malta_defconfig
>  - qemu_mips64el_malta_defconfig
>  - qemu_mips64_malta_defconfig
>  - qemu_mips64r6el_malta_defconfig
>  - qemu_mips64r6_malta_defconfig
>  - qemu_nios2_10m50_defconfig
>  - qemu_or1k_defconfig
>  - qemu_ppc64_pseries_defconfig
>  - qemu_ppc_g3beige_defconfig
>  - qemu_ppc_mpc8544ds_defconfig
>  - qemu_ppc_virtex_ml507_defconfig
>  - qemu_sh4eb_r2d_defconfig
>  - qemu_sh4_r2d_defconfig
>  - qemu_sparc64_sun4u_defconfig
>  - qemu_sparc_ss10_defconfig
>  - qemu_x86_64_defconfig
>  - qemu_x86_defconfig
>  - qemu_xtensa_lx60_defconfig
>  - qemu_xtensa_lx60_nommu_defconfig
>  - raspberrypi0_defconfig
>  - raspberrypi2_defconfig
>  - raspberrypi3_64_defconfig
>  - raspberrypi3_qt5we_defconfig
>  - raspberrypi_defconfig
>  - riotboard_defconfig
>  - roseapplepi_defconfig
>  - s6lx9_microboard_defconfig
>  - sheevaplug_defconfig
>  - snps_aarch64_vdk_defconfig
>  - snps_arc700_axs101_defconfig
>  - snps_archs38_axs103_defconfig
>  - snps_archs38_haps_defconfig
>  - snps_archs38_vdk_defconfig
>  - stm32f429_disco_defconfig
>  - stm32f469_disco_defconfig
>  - telit_evk_pro3_defconfig
>  - toradex_apalis_imx6_defconfig
>  - ts4800_defconfig
>  - ts5x00_defconfig
>  - ts7680_defconfig
>  - warpboard_defconfig
>  - zynq_microzed_defconfig
>  - zynq_zc706_defconfig
>  - zynq_zed_defconfig
>  - zynq_zybo_defconfig
> 
> Thanks for your participation!
> 
> Thomas

I was under the impression I'm maintaining the odroidc2 board, did to got changed?
the config didn't got updated lately because I'm focusing on the mainline support (see patches pending).
regardless, I'll make a pass on the vendor's repo to see if there are any updates.

Dagg.
