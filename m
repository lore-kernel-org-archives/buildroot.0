From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Jun 2013 11:14:29 -0300
Subject: [Buildroot] [PATCH 5/5] freetype: bump to version 2.4.12
In-Reply-To: <1371046469-19194-1-git-send-email-gustavo@zacarias.com.ar>
References: <1371046469-19194-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1371046469-19194-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/freetype/freetype.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 997f906..16f00fe 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.4.11
+FREETYPE_VERSION = 2.4.12
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_SITE = http://downloads.sourceforge.net/project/freetype/freetype2/$(FREETYPE_VERSION)
 FREETYPE_INSTALL_STAGING = YES
-- 
1.8.1.5
