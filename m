From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Apr 2017 10:39:35 +0200
Subject: [Buildroot] [git commit] .gitlab-ci.yml: refresh after rename of
	Synopsys ARC defconfigs
Message-ID: <20170416084136.A3CD781898@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a8fe861c930285892815f2065f7a11310f8bcf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .gitlab-ci.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 678cb69..435888a 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -175,10 +175,10 @@ roseapplepi_defconfig: *defconfig
 s6lx9_microboard_defconfig: *defconfig
 sheevaplug_defconfig: *defconfig
 snps_aarch64_vdk_defconfig: *defconfig
+snps_arc700_axs101_defconfig: *defconfig
+snps_archs38_axs103_defconfig: *defconfig
 snps_archs38_vdk_defconfig: *defconfig
 snps_archs38_zebu_defconfig: *defconfig
-snps_axs101_defconfig: *defconfig
-snps_axs103_defconfig: *defconfig
 stm32f429_disco_defconfig: *defconfig
 stm32f469_disco_defconfig: *defconfig
 telit_evk_pro3_defconfig: *defconfig
