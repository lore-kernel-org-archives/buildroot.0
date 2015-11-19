From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Nov 2015 22:31:44 +0100
Subject: [Buildroot] [PATCH 2/2] configs/qemu: enable dhcp on network
 interfaces
In-Reply-To: <1447893511-14876-2-git-send-email-gustavo@zacarias.com.ar>
References: <1447893511-14876-1-git-send-email-gustavo@zacarias.com.ar>
 <1447893511-14876-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151119223144.1fea0b45@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 18 Nov 2015 21:38:31 -0300, Gustavo Zacarias wrote:
> Enable dhcp networking for qemu configs considered good enough for
> testing purposes.
> 
> This excludes:
> arm_nuri - emulation doesn't seem 100% correct for networking.
> ppc_virtex_ml507 - doesn't emulate networking.
> sh4eb - emulation doesn't seem 100% correct for the NIC.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  configs/qemu_aarch64_virt_defconfig     | 1 +
>  configs/qemu_arm_versatile_defconfig    | 1 +
>  configs/qemu_arm_vexpress_defconfig     | 1 +
>  configs/qemu_microblazebe_mmu_defconfig | 1 +
>  configs/qemu_microblazeel_mmu_defconfig | 1 +
>  configs/qemu_mips64_malta_defconfig     | 3 +++
>  configs/qemu_mips64el_malta_defconfig   | 3 +++
>  configs/qemu_mips_malta_defconfig       | 3 +++
>  configs/qemu_mipsel_malta_defconfig     | 3 +++
>  configs/qemu_ppc64_pseries_defconfig    | 1 +
>  configs/qemu_ppc_g3beige_defconfig      | 3 +++
>  configs/qemu_ppc_mpc8544ds_defconfig    | 3 +++
>  configs/qemu_sh4_r2d_defconfig          | 1 +
>  configs/qemu_sparc64_sun4u_defconfig    | 3 +++
>  configs/qemu_sparc_ss10_defconfig       | 3 +++
>  configs/qemu_x86_64_defconfig           | 1 +
>  configs/qemu_x86_defconfig              | 1 +
>  configs/qemu_xtensa_lx60_defconfig      | 1 +
>  18 files changed, 34 insertions(+)

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
