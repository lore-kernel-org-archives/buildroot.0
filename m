From: Axel Lin <axel.lin@ingics.com>
Date: Sat, 05 Oct 2013 17:35:53 +0800
Subject: [Buildroot] [PATCH] neon: bump to version 0.30.0
Message-ID: <1380965753.24323.0.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/neon/neon.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 2edc6b2..177ae6a 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEON_VERSION = 0.29.6
+NEON_VERSION = 0.30.0
 NEON_SITE = http://www.webdav.org/neon/
 NEON_LICENSE = LGPLv2+ (library), GPLv2+ (manual and tests)
 NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README
-- 
1.8.1.2
