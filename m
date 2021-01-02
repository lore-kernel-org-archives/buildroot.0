From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 21:19:58 +0100
Subject: [Buildroot] [git commit] package/bctoolbox: bump to version 4.4.8
Message-ID: <20210102200213.4FE76812EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7be3831f6d84de61fd8cd69b492b3c42aa34806f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license has changed from GPL-2.0+ to GPL-3.0+.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bctoolbox/bctoolbox.hash | 4 ++--
 package/bctoolbox/bctoolbox.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/bctoolbox/bctoolbox.hash b/package/bctoolbox/bctoolbox.hash
index 7d64c32013..9b1f9e821d 100644
--- a/package/bctoolbox/bctoolbox.hash
+++ b/package/bctoolbox/bctoolbox.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d8501e3793c10abbf913759d7a0e5f6eb3140af6bacf5e2bdcd532049bde69c0  bctoolbox-4.3.1.tar.gz
-sha256  849dd903d98f12a964466ccfbaf3a1de1f94ad0ebd49a59d12f8ce4506f9f647  COPYING
+sha256  446b60e81a79b11e8212c44e312aeb0ce46e9ecf0269a35c492ecdca3e7428c3  bctoolbox-4.4.8.tar.gz
+sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
diff --git a/package/bctoolbox/bctoolbox.mk b/package/bctoolbox/bctoolbox.mk
index 230394970c..ac9361026f 100644
--- a/package/bctoolbox/bctoolbox.mk
+++ b/package/bctoolbox/bctoolbox.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-BCTOOLBOX_VERSION = 4.3.1
+BCTOOLBOX_VERSION = 4.4.8
 BCTOOLBOX_SITE = $(call github,BelledonneCommunications,bctoolbox,$(BCTOOLBOX_VERSION))
-BCTOOLBOX_LICENSE = GPL-2.0+
-BCTOOLBOX_LICENSE_FILES = COPYING
+BCTOOLBOX_LICENSE = GPL-3.0+
+BCTOOLBOX_LICENSE_FILES = LICENSE.txt
 BCTOOLBOX_INSTALL_STAGING = YES
 
 # Set CMAKE_SKIP_RPATH to prevent bctoolbox from adding the rpath to
