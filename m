From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 27 Oct 2019 10:02:40 +0100
Subject: [Buildroot] [PATCH] package/gflags: bump to version 2.2.2
Message-ID: <20191027090240.28804-1-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/gflags/gflags.hash | 2 +-
 package/gflags/gflags.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gflags/gflags.hash b/package/gflags/gflags.hash
index 18483b1101..1f7fe60332 100644
--- a/package/gflags/gflags.hash
+++ b/package/gflags/gflags.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256	466c36c6508a451734e4f4d76825cf9cd9b8716d2b70ef36479ae40f08271f88	gflags-2.2.0.tar.gz
+sha256 34af2f15cf7367513b352bdcd2493ab14ce43692d2dcd9dfc499492966c64dcf gflags-2.2.2.tar.gz
 
 # Hash for license file:
 sha256 90d1f3701813c3cd65eee2dc736746fe46b465918f3f7d6d31463a2018b33fa5  COPYING.txt
diff --git a/package/gflags/gflags.mk b/package/gflags/gflags.mk
index 920100c13f..c4fce45b3e 100644
--- a/package/gflags/gflags.mk
+++ b/package/gflags/gflags.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GFLAGS_VERSION = 2.2.0
+GFLAGS_VERSION = 2.2.2
 GFLAGS_SITE = $(call github,gflags,gflags,v$(GFLAGS_VERSION))
 GFLAGS_INSTALL_STAGING = YES
 GFLAGS_LICENSE = BSD-3-Clause
-- 
2.17.1
