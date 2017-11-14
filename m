From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 14 Nov 2017 10:51:43 +0100
Subject: [Buildroot] [PATCH] libogg: bump to version 1.3.3
Message-ID: <20171114095143.24635-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/libogg/libogg.hash | 2 +-
 package/libogg/libogg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libogg/libogg.hash b/package/libogg/libogg.hash
index 393ebee2a3..0c65b8e1a9 100644
--- a/package/libogg/libogg.hash
+++ b/package/libogg/libogg.hash
@@ -1,2 +1,2 @@
 # From: http://www.xiph.org/downloads/
-sha256 3f687ccdd5ac8b52d76328fbbfebc70c459a40ea891dbf3dccb74a210826e79b libogg-1.3.2.tar.xz
+sha256 4f3fc6178a533d392064f14776b23c397ed4b9f48f5de297aba73b643f955c08 libogg-1.3.3.tar.xz
diff --git a/package/libogg/libogg.mk b/package/libogg/libogg.mk
index 28b55a888f..4c97e9a913 100644
--- a/package/libogg/libogg.mk
+++ b/package/libogg/libogg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOGG_VERSION = 1.3.2
+LIBOGG_VERSION = 1.3.3
 LIBOGG_SOURCE = libogg-$(LIBOGG_VERSION).tar.xz
 LIBOGG_SITE = http://downloads.xiph.org/releases/ogg
 LIBOGG_LICENSE = BSD-3-Clause
-- 
2.15.0
