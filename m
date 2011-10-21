From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 21 Oct 2011 09:19:59 -0300
Subject: [Buildroot] [PATCH 2/2] freetype: security bump to version 2.4.7
In-Reply-To: <1319199599-1967-1-git-send-email-gustavo@zacarias.com.ar>
References: <1319199599-1967-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1319199599-1967-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/freetype/freetype.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index fe6e5d6..142a1ec 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -3,11 +3,11 @@
 # freetype
 #
 #############################################################
-FREETYPE_VERSION = 2.4.6
+
+FREETYPE_VERSION = 2.4.7
 FREETYPE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/freetype
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_INSTALL_STAGING = YES
-FREETYPE_INSTALL_TARGET = YES
 FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
 FREETYPE_DEPENDENCIES = host-pkg-config $(if $(BR2_PACKAGE_ZLIB),zlib)
 
-- 
1.7.3.4
