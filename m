From: Drew Fustini <drew@beagleboard.org>
Date: Sat,  5 Jun 2021 17:51:23 -0700
Subject: [Buildroot] [PATCH] boot/beaglev-secondboot: update to include
 upstream fixes
Message-ID: <20210606005122.377029-1-drew@beagleboard.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the commit id to include upstream fixes:

- Fix print format in load_and_run_ddr(e976d186e69a)
- Update copyright info (f2b049b7fff2)
- Avoid chiplink address exception (86664be28e5d)

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 boot/beaglev-secondboot/beaglev-secondboot.hash | 2 +-
 boot/beaglev-secondboot/beaglev-secondboot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/beaglev-secondboot/beaglev-secondboot.hash b/boot/beaglev-secondboot/beaglev-secondboot.hash
index d936263d1a2f..e0ca0e149dab 100644
--- a/boot/beaglev-secondboot/beaglev-secondboot.hash
+++ b/boot/beaglev-secondboot/beaglev-secondboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  b97dc40dbfc49ced591d6ef53d06adebf90b9c467d3754ec51b2626593d97cbd  beaglev-secondboot-a4f0b4307f877890f998b3216cffcc9f27a5f993.tar.gz
+sha256  56519b20a8ac2b68770cacd5158190dfcb2b3762a759b1c44582ca25ffbccc5d  beaglev-secondboot-e976d186e69a1a84884265b0689626fa254a950d.tar.gz
diff --git a/boot/beaglev-secondboot/beaglev-secondboot.mk b/boot/beaglev-secondboot/beaglev-secondboot.mk
index 7bd97165decc..6d904b02ba31 100644
--- a/boot/beaglev-secondboot/beaglev-secondboot.mk
+++ b/boot/beaglev-secondboot/beaglev-secondboot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Commit on the 'starfive' branch
-BEAGLEV_SECONDBOOT_VERSION = a4f0b4307f877890f998b3216cffcc9f27a5f993
+BEAGLEV_SECONDBOOT_VERSION = e976d186e69a1a84884265b0689626fa254a950d
 BEAGLEV_SECONDBOOT_SITE = $(call github,starfive-tech,beagle_secondBoot,$(BEAGLEV_SECONDBOOT_VERSION))
 BEAGLEV_SECONDBOOT_INSTALL_TARGET = NO
 BEAGLEV_SECONDBOOT_INSTALL_IMAGES = YES
-- 
2.27.0
