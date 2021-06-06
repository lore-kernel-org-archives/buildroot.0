From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Jun 2021 09:25:07 +0200
Subject: [Buildroot] [git commit] boot/beaglev-secondboot: update to include
 upstream fixes
Message-ID: <20210606065707.DBCF381470@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1e014655da6b77c9e1768cb0d6fb78f1321ae5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the commit id to include upstream fixes:

- Fix print format in load_and_run_ddr(e976d186e69a)
- Update copyright info (f2b049b7fff2)
- Avoid chiplink address exception (86664be28e5d)

Signed-off-by: Drew Fustini <drew@beagleboard.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/beaglev-secondboot/beaglev-secondboot.hash | 2 +-
 boot/beaglev-secondboot/beaglev-secondboot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/beaglev-secondboot/beaglev-secondboot.hash b/boot/beaglev-secondboot/beaglev-secondboot.hash
index d936263d1a..e0ca0e149d 100644
--- a/boot/beaglev-secondboot/beaglev-secondboot.hash
+++ b/boot/beaglev-secondboot/beaglev-secondboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  b97dc40dbfc49ced591d6ef53d06adebf90b9c467d3754ec51b2626593d97cbd  beaglev-secondboot-a4f0b4307f877890f998b3216cffcc9f27a5f993.tar.gz
+sha256  56519b20a8ac2b68770cacd5158190dfcb2b3762a759b1c44582ca25ffbccc5d  beaglev-secondboot-e976d186e69a1a84884265b0689626fa254a950d.tar.gz
diff --git a/boot/beaglev-secondboot/beaglev-secondboot.mk b/boot/beaglev-secondboot/beaglev-secondboot.mk
index 7bd97165de..6d904b02ba 100644
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
