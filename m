From: Drew Fustini <drew@beagleboard.org>
Date: Sat,  5 Jun 2021 17:53:42 -0700
Subject: [Buildroot] [PATCH] boot/beaglev-ddrinit: update to include
 upstream fixes
Message-ID: <20210606005341.377449-1-drew@beagleboard.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update commit ID to include recent upstream fixes:

- Fix I and D cache synchronization issue (2e2f6faaf105)
- Add carriage return to correct menu formatting (2f6ea51dbb51)
- Add copyright info (7d3413d2ffd9)
- Expand the limit on the size of uboot when update it (623888127a0e)

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 boot/beaglev-ddrinit/beaglev-ddrinit.hash | 2 +-
 boot/beaglev-ddrinit/beaglev-ddrinit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/beaglev-ddrinit/beaglev-ddrinit.hash b/boot/beaglev-ddrinit/beaglev-ddrinit.hash
index 5bbbe28f07af..7f433466964f 100644
--- a/boot/beaglev-ddrinit/beaglev-ddrinit.hash
+++ b/boot/beaglev-ddrinit/beaglev-ddrinit.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  0809b72e1e8e40f82acdcfd4c8a6a120e14bd9ed395592e075bb54acc8c07271  beaglev-ddrinit-15b80de81263996affb2a29332aa681925709983.tar.gz
+sha256  df58c3da7a6f429095f4d56e7f1f5b7c855a0cbe82a2569586ce0c5fdd1bf256  beaglev-ddrinit-2e2f6faaf1059b61bb06ea00404199d1de55f201.tar.gz
diff --git a/boot/beaglev-ddrinit/beaglev-ddrinit.mk b/boot/beaglev-ddrinit/beaglev-ddrinit.mk
index 02df0613ee6c..2f1ce3ee87a0 100644
--- a/boot/beaglev-ddrinit/beaglev-ddrinit.mk
+++ b/boot/beaglev-ddrinit/beaglev-ddrinit.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Commit on the 'starfive' branch
-BEAGLEV_DDRINIT_VERSION = 15b80de81263996affb2a29332aa681925709983
+BEAGLEV_DDRINIT_VERSION = 2e2f6faaf1059b61bb06ea00404199d1de55f201
 BEAGLEV_DDRINIT_SITE = $(call github,starfive-tech,beagle_ddrinit,$(BEAGLEV_DDRINIT_VERSION))
 BEAGLEV_DDRINIT_INSTALL_TARGET = NO
 BEAGLEV_DDRINIT_INSTALL_IMAGES = YES
-- 
2.27.0
