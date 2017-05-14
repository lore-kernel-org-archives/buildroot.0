From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 May 2017 13:56:38 +0200
Subject: [Buildroot] [git commit] .gitlab-ci.yml: regenerate after
	snps_archs38_zebu_defconfig rename
Message-ID: <20170514115704.1EA72827E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be95978f3c83a481b88eccb57de8814522a40c88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a60cf91..5fb6454 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -179,8 +179,8 @@ sheevaplug_defconfig: *defconfig
 snps_aarch64_vdk_defconfig: *defconfig
 snps_arc700_axs101_defconfig: *defconfig
 snps_archs38_axs103_defconfig: *defconfig
+snps_archs38_haps_defconfig: *defconfig
 snps_archs38_vdk_defconfig: *defconfig
-snps_archs38_zebu_defconfig: *defconfig
 stm32f429_disco_defconfig: *defconfig
 stm32f469_disco_defconfig: *defconfig
 telit_evk_pro3_defconfig: *defconfig
