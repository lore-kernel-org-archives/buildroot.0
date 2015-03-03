From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Mar 2015 07:59:59 +0100
Subject: [Buildroot] [git commit] configs/qemu: update to the latest
	kernel/headers versions
Message-ID: <20150303070134.31230807DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=059a013ed887234b3d434d476989c204b066e420
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qemu_arm_vexpress_defconfig is broken for 3.19 so keep it with 3.18.x

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../{linux-3.18.config => linux-3.19.config}       |    0
 .../{linux-3.18.config => linux-3.19.config}       |    0
 .../{linux-3.18.config => linux-3.19.config}       |    0
 .../{linux-3.18.config => linux-3.19.config}       |    0
 .../{linux-3.18.config => linux-3.19.config}       |    0
 .../{linux-3.18.config => linux-3.19.config}       |    0
 .../{linux-3.18.config => linux-3.19.config}       |    0
 .../{linux-3.18.config => linux-3.19.config}       |    0
 .../{linux-3.18.config => linux-3.19.config}       |    0
 .../{linux-3.18.config => linux-3.19.config}       |    0
 .../{linux-3.18.config => linux-3.19.config}       |    0
 .../x86/{linux-3.18.config => linux-3.19.config}   |    0
 .../{linux-3.18.config => linux-3.19.config}       |    0
 .../{linux-3.18.config => linux-3.19.config}       |    0
 configs/qemu_aarch64_virt_defconfig                |   10 +++++-----
 configs/qemu_arm_nuri_defconfig                    |    4 ++--
 configs/qemu_arm_versatile_defconfig               |   10 +++++-----
 configs/qemu_arm_vexpress_defconfig                |    4 ++--
 configs/qemu_microblazebe_mmu_defconfig            |   10 +++++-----
 configs/qemu_microblazeel_mmu_defconfig            |   10 +++++-----
 configs/qemu_mips64_malta_defconfig                |   10 +++++-----
 configs/qemu_mips64el_malta_defconfig              |   10 +++++-----
 configs/qemu_mips_malta_defconfig                  |   10 +++++-----
 configs/qemu_mipsel_malta_defconfig                |   10 +++++-----
 configs/qemu_ppc64_pseries_defconfig               |    8 ++++----
 configs/qemu_ppc_g3beige_defconfig                 |   10 +++++-----
 configs/qemu_ppc_mpc8544ds_defconfig               |    8 ++++----
 configs/qemu_ppc_virtex_ml507_defconfig            |    8 ++++----
 configs/qemu_sh4_r2d_defconfig                     |   10 +++++-----
 configs/qemu_sparc_ss10_defconfig                  |   10 +++++-----
 configs/qemu_x86_64_defconfig                      |   10 +++++-----
 configs/qemu_x86_defconfig                         |   10 +++++-----
 configs/qemu_xtensa_lx60_defconfig                 |   10 +++++-----
 33 files changed, 86 insertions(+), 86 deletions(-)

Patch is too large, so refusing to show it
