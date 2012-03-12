From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Mar 2012 11:23:02 -0300
Subject: [Buildroot] [PATCH] freetype: security bump to version 2.4.9
Message-ID: <1331562182-4127-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump freetype to version 2.4.9 to fix:
CVE-2012-1126, CVE-2012-1127, CVE-2012-1128, CVE-2012-1129,
CVE-2012-1130, CVE-2012-1131, CVE-2012-1132, CVE-2012-1133,
CVE-2012-1134, CVE-2012-1135, CVE-2012-1136, CVE-2012-1137,
CVE-2012-1138, CVE-2012-1139, CVE-2012-1140, CVE-2012-1141,
CVE-2012-1142, CVE-2012-1143, and CVE 2012-1144.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/freetype/freetype.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 32099da..ded10d2 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-FREETYPE_VERSION = 2.4.8
+FREETYPE_VERSION = 2.4.9
 FREETYPE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/freetype
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_INSTALL_STAGING = YES
-- 
1.7.3.4
