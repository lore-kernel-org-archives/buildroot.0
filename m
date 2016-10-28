From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Oct 2016 14:42:50 +0200
Subject: [Buildroot] [git commit] mmc-utils: bump version to 2cb6695
Message-ID: <20161028124448.8D08581972@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52b8a5d4f8be1b297f02c15d6e74a6e6ce383677
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change log since last version bump:

  2cb6695 Add missing -c for write_reliability
  e094e28 Fix return value check from set_partitioning_setting_completed()
  f90eac4 Add help texts for -c option
  752072d Add -c option for partitioning commands
  55380d9 Register being set is other than mentioned in printed message.
  3c02759 Fix reported offset for enhanced user area start address
  a3d3331 mmc-utils: Add Command Queue fields to Extended CSD
  0ca049f mmc-utils: Add ability to configure write protect on an eMMC device
  bb779ac mmc-utils: Add disable partition boot to 'mmc bootpart enable'
  89cd01e mmc_utils: add ffu support
  4af1749 mmc-utils: Merge the lsmmc tool into mmc-utils
  44f94b9 mmc_utils: doc: add man-page
  928ff07 mmc_utils: gp create: only allow partition [1-4] to be selected

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mmc-utils/mmc-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index 82468bc..7473a1b 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MMC_UTILS_VERSION = d0b46442b50794217e53b2455c1344c548d9d088
+MMC_UTILS_VERSION = 2cb6695e8dec00d887bdd5309d1b57d836fcd214
 MMC_UTILS_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git
 MMC_UTILS_LICENSE = GPLv2
 
