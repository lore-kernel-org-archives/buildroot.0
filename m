From: Axel Lin <axel.lin@ingics.com>
Date: Wed, 09 Oct 2013 09:28:27 +0800
Subject: [Buildroot] [PATCH 2/2] xmlstarlet: bump to version 1.5.0
In-Reply-To: <1381281980.27485.2.camel@phoenix>
References: <1381281980.27485.2.camel@phoenix>
Message-ID: <1381282107.27485.4.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/xmlstarlet/xmlstarlet.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index 4a30feb..16f736e 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XMLSTARLET_VERSION = 1.3.0
+XMLSTARLET_VERSION = 1.5.0
 XMLSTARLET_SITE = http://downloads.sourceforge.net/project/xmlstar/xmlstarlet/$(XMLSTARLET_VERSION)
 XMLSTARLET_LICENSE = MIT
 XMLSTARLET_LICENSE_FILES = COPYING Copyright
-- 
1.8.1.2
