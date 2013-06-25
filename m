From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue, 25 Jun 2013 07:15:46 +0200
Subject: [Buildroot] [PATCH 1/1] mxml: fix site url
Message-ID: <1372137346-7557-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/mxml/mxml.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
index 778e9bf..020cde2 100644
--- a/package/mxml/mxml.mk
+++ b/package/mxml/mxml.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MXML_VERSION = 2.7
-MXML_SITE = http://ftp.easysw.com/pub/mxml/$(MXML_VERSION)
+MXML_SITE = http://www.msweet.org/files/project3
 MXML_LICENSE = LGPLv2+ with exceptions
 MXML_LICENSE_FILES = COPYING
 MXML_INSTALL_STAGING = YES
-- 
1.7.9.5
