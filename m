From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 15 Apr 2017 21:39:40 +0200
Subject: [Buildroot] [PATCH] .gitlab-ci.yml: refresh after rename of
	Synopsys ARC defconfigs
Message-ID: <20170415193940.30733-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 678cb697d3..435888a772 100644
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
-- 
2.11.0
