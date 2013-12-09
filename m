From: Axel Lin <axel.lin@ingics.com>
Date: Mon, 09 Dec 2013 10:05:00 +0800
Subject: [Buildroot] [PATCH] snappy: bump to version 1.1.1
Message-ID: <1386554700.18790.0.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/snappy/snappy.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index d8ec239..b94f8cc 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNAPPY_VERSION		= 1.1.0
+SNAPPY_VERSION		= 1.1.1
 SNAPPY_SITE		= http://snappy.googlecode.com/files/
 SNAPPY_LICENSE		= BSD-3c
 SNAPPY_LICENSE_FILES	= COPYING
-- 
1.8.1.2
