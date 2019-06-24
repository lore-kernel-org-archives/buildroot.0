From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Jun 2019 21:25:15 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/davfs2: bump to
 version 1.5.5
Message-ID: <20190624192412.371648142E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7d7025abfdf53dbebb651dd690858f8a41b4441
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a724e8e0512212a309e581ab1b48d67584510fb6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/davfs2/davfs2.hash | 2 +-
 package/davfs2/davfs2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/davfs2/davfs2.hash b/package/davfs2/davfs2.hash
index 102659a38d..7e2078bec5 100644
--- a/package/davfs2/davfs2.hash
+++ b/package/davfs2/davfs2.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 c9c4e0f0912a782386216b2147eb9c36c47f193b8fcf3d637719e0b9fe7c96e0  davfs2-1.5.4.tar.gz
+sha256 587c6a25ad78109995a7ccb8e60aa1c491b149f2c99d47033f3d5e648430ad2f  davfs2-1.5.5.tar.gz
 # License file, locally calculated
 sha256 0ae0485a5bd37a63e63603596417e4eb0e653334fa6c7f932ca3a0e85d4af227  COPYING
diff --git a/package/davfs2/davfs2.mk b/package/davfs2/davfs2.mk
index f2b2fdbe41..90f73f4df0 100644
--- a/package/davfs2/davfs2.mk
+++ b/package/davfs2/davfs2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAVFS2_VERSION = 1.5.4
+DAVFS2_VERSION = 1.5.5
 DAVFS2_SITE = http://download.savannah.nongnu.org/releases/davfs2
 DAVFS2_LICENSE = GPL-3.0+
 DAVFS2_LICENSE_FILES = COPYING
