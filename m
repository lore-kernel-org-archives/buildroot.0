From: Axel Lin <axel.lin@ingics.com>
Date: Thu, 03 Oct 2013 13:32:54 +0800
Subject: [Buildroot] [PATCH] radvd: bump to version 1.9.5
Message-ID: <1380778374.884.0.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/radvd/radvd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index aed6f01..c1c4e41 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RADVD_VERSION = 1.9.3
+RADVD_VERSION = 1.9.5
 RADVD_SITE = http://www.litech.org/radvd/dist
 RADVD_DEPENDENCIES = host-bison flex libdaemon host-flex host-pkgconf
 
-- 
1.8.1.2
