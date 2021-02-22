From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 22 Feb 2021 08:13:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/ushare: bump to version 2.1
Message-ID: <20210222071301.220417-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix SOAP action responses which are broken since the switch to latest
version of libupnp (1.14.x) in version 2.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ushare/ushare.hash | 2 +-
 package/ushare/ushare.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ushare/ushare.hash b/package/ushare/ushare.hash
index 4d009dd99f..013b247951 100644
--- a/package/ushare/ushare.hash
+++ b/package/ushare/ushare.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  3bfc2eecdbbbf3c1778f70e8e8a8fc4638fbf52081c4b047a59204f079a4a580  ushare-2.0.tar.gz
+sha256  e4563141a171138900540cc979f205cf666e820f709d47a98521bc77f53a99e6  ushare-2.1.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/ushare/ushare.mk b/package/ushare/ushare.mk
index 59dddb4bf1..a4c9711600 100644
--- a/package/ushare/ushare.mk
+++ b/package/ushare/ushare.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USHARE_VERSION = 2.0
+USHARE_VERSION = 2.1
 USHARE_SITE = $(call github,ddugovic,uShare,v$(USHARE_VERSION))
 USHARE_DEPENDENCIES = host-pkgconf libupnp $(TARGET_NLS_DEPENDENCIES)
 USHARE_LICENSE = GPL-2.0+
-- 
2.30.0
