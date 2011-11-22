From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Nov 2011 22:59:21 -0300
Subject: [Buildroot] [PATCH] freetype: security bump to version 2.4.8
Message-ID: <1321927161-13262-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump freetype to version 2.4.8 to fix CVE-2011-3439.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/freetype/freetype.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 142a1ec..6eb6b29 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-FREETYPE_VERSION = 2.4.7
+FREETYPE_VERSION = 2.4.8
 FREETYPE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/freetype
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_INSTALL_STAGING = YES
-- 
1.7.3.4
