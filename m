From: Axel Lin <axel.lin@ingics.com>
Date: Wed, 09 Oct 2013 09:26:20 +0800
Subject: [Buildroot] [PATCH 1/2] xmlstarlet: add license information
Message-ID: <1381281980.27485.2.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/xmlstarlet/xmlstarlet.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index f0a26c2..4a30feb 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -6,6 +6,8 @@
 
 XMLSTARLET_VERSION = 1.3.0
 XMLSTARLET_SITE = http://downloads.sourceforge.net/project/xmlstar/xmlstarlet/$(XMLSTARLET_VERSION)
+XMLSTARLET_LICENSE = MIT
+XMLSTARLET_LICENSE_FILES = COPYING Copyright
 
 XMLSTARLET_DEPENDENCIES += libxml2 libxslt \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
-- 
1.8.1.2
