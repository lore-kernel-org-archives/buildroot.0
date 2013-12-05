From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 Dec 2013 11:04:47 -0300
Subject: [Buildroot] [PATCH 1/2] freetype: bump to version 2.5.1
Message-ID: <1386252288-7835-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/freetype/freetype.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 1e378d3..398bf61 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-FREETYPE_VERSION_MAJOR = 2.5.0
-FREETYPE_VERSION_MINOR = 1
-FREETYPE_VERSION = $(FREETYPE_VERSION_MAJOR).$(FREETYPE_VERSION_MINOR)
+FREETYPE_VERSION = 2.5.1
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
-FREETYPE_SITE = http://downloads.sourceforge.net/project/freetype/freetype2/$(FREETYPE_VERSION_MAJOR)
+FREETYPE_SITE = http://downloads.sourceforge.net/project/freetype/freetype2/$(FREETYPE_VERSION)
 FREETYPE_INSTALL_STAGING = YES
 FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
 FREETYPE_LICENSE = Dual FTL/GPLv2+
-- 
1.8.3.2
