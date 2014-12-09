From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 9 Dec 2014 14:30:37 +0100
Subject: [Buildroot] [git commit] configs/qemu: update to the latest
	kernel/headers versions
Message-ID: <20141209133124.6DA8B800B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3a4b97bfb06ecabf2849aae0b308396dd8aac8ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../{linux-3.17.config => linux-3.18.config}       |    0
 .../{linux-3.17.config => linux-3.18.config}       |    0
 .../{linux-3.17.config => linux-3.18.config}       |    0
 .../{linux-3.17.config => linux-3.18.config}       |    0
 .../{linux-3.17.config => linux-3.18.config}       |    0
 .../{linux-3.17.config => linux-3.18.config}       |    0
 .../{linux-3.17.config => linux-3.18.config}       |    0
 .../{linux-3.17.config => linux-3.18.config}       |    0
 .../{linux-3.17.config => linux-3.18.config}       |    0
 .../{linux-3.17.config => linux-3.18.config}       |    0
 .../{linux-3.17.config => linux-3.18.config}       |    0
 .../x86/{linux-3.17.config => linux-3.18.config}   |    0
 .../{linux-3.17.config => linux-3.18.config}       |    0
 .../{linux-3.17.config => linux-3.18.config}       |    0
 configs/qemu_aarch64_virt_defconfig                |   10 +++++-----
 configs/qemu_arm_nuri_defconfig                    |    4 ++--
 configs/qemu_arm_versatile_defconfig               |   10 +++++-----
 configs/qemu_arm_vexpress_defconfig                |    8 ++++----
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
 33 files changed, 88 insertions(+), 88 deletions(-)

Patch is too large, so refusing to show it
