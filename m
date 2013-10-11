From: Axel Lin <axel.lin@ingics.com>
Date: Fri, 11 Oct 2013 11:54:22 +0800
Subject: [Buildroot] [PATCH] ola: bump to version 0.8.32
Message-ID: <1381463662.12012.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/ola/ola.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index d7ddab7..835ca4e 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OLA_VERSION = 0.8.31
+OLA_VERSION = 0.8.32
 OLA_SITE = https://open-lighting.googlecode.com/files
 
 OLA_LICENSE = LGPLv2.1+ (libola, libolacommon, Python bindings), GPLv2+ (libolaserver, olad, Python examples and tests)
-- 
1.8.1.2
