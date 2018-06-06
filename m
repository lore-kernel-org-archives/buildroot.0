From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Jun 2018 22:06:10 +0200
Subject: [Buildroot] [git commit] libucl: bump to version 0.8.1
Message-ID: <20180606200855.1A0BF80279@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b778f48d7310706b18feda1b4d87e91b3136ad21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libucl/libucl.hash | 3 ++-
 package/libucl/libucl.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libucl/libucl.hash b/package/libucl/libucl.hash
index bd2ca13bf3..8d4a796e22 100644
--- a/package/libucl/libucl.hash
+++ b/package/libucl/libucl.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 2f69995c7f8320350f56c1183c395cc4a2a958331f22d60b7839a117c9c601e1  libucl-0.7.3.tar.gz
+sha256 a6397e179672f0e8171a0f9a2cfc37e01432b357fd748b13f4394436689d24ef  libucl-0.8.1.tar.gz
+sha256 1bf976835764c1d827e07472a0a75adb098682df56681878af05fc0db7439b03  COPYING
diff --git a/package/libucl/libucl.mk b/package/libucl/libucl.mk
index 39a7ed3cc7..087fea683d 100644
--- a/package/libucl/libucl.mk
+++ b/package/libucl/libucl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUCL_VERSION = 0.7.3
+LIBUCL_VERSION = 0.8.1
 LIBUCL_SITE = $(call github,vstakhov,libucl,$(LIBUCL_VERSION))
 LIBUCL_INSTALL_STAGING = YES
 LIBUCL_AUTORECONF = YES
