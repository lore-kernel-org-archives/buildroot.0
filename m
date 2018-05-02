From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  2 May 2018 20:33:36 +0200
Subject: [Buildroot] [PATCH v2,2/2] libgdiplus: bump to version 5.6
In-Reply-To: <20180502183336.13568-1-fontaine.fabrice@gmail.com>
References: <20180502183336.13568-1-fontaine.fabrice@gmail.com>
Message-ID: <20180502183336.13568-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni and Sergio Prado):
 - Fix license from MIT to LGPL-2.1 or MPL-1.1 (in a separate patch)

 package/libgdiplus/libgdiplus.hash | 3 ++-
 package/libgdiplus/libgdiplus.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libgdiplus/libgdiplus.hash b/package/libgdiplus/libgdiplus.hash
index 740fefd986..434fda8bd9 100644
--- a/package/libgdiplus/libgdiplus.hash
+++ b/package/libgdiplus/libgdiplus.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 ce31da0c6952c8fd160813dfa9bf4a9a871bfe7284e9e3abff9a8ee689acfe58 libgdiplus-5.4.tar.gz
+sha256 6a75e4a476695cd6a1475fd6b989423ecf73978fd757673669771d8a6e13f756 libgdiplus-5.6.tar.gz
+sha256 91f86875b1116ec9644f2a07a00f2046534fbe1658fd571100602c71655aca6c LICENSE
diff --git a/package/libgdiplus/libgdiplus.mk b/package/libgdiplus/libgdiplus.mk
index 52032d4f07..18da651d7b 100644
--- a/package/libgdiplus/libgdiplus.mk
+++ b/package/libgdiplus/libgdiplus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGDIPLUS_VERSION = 5.4
+LIBGDIPLUS_VERSION = 5.6
 LIBGDIPLUS_SITE = $(call github,mono,libgdiplus,$(LIBGDIPLUS_VERSION))
 LIBGDIPLUS_LICENSE = LGPL-2.1 or MPL-1.1
 LIBGDIPLUS_LICENSE_FILES = LICENSE
-- 
2.14.1
