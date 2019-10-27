From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 10:10:04 +0100
Subject: [Buildroot] [git commit] package/gflags: bump to version 2.2.2
Message-ID: <20191027090636.7CEDA800E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1dc41b3f617bd0c664783aac4e456f1e5f8d537b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
