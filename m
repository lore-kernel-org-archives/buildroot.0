From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Dec 2012 07:34:17 -0300
Subject: [Buildroot] [PATCH] freetype: fix legal-info
Message-ID: <1356690857-28463-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

My mistake, wrong capitalization, fixes
http://autobuild.buildroot.net/results/10261b94d95f7547a08d8fa1d0b0ddcae85c38a3

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/freetype/freetype.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index be87a48..be0f1a7 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -10,7 +10,7 @@ FREETYPE_SITE = http://downloads.sourceforge.net/project/freetype/freetype2/$(FR
 FREETYPE_INSTALL_STAGING = YES
 FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
 FREETYPE_LICENSE = Dual FTL/GPLv2+
-FREETYPE_LICENSE_FILES = docs/FTL.txt docs/GPLv2.txt
+FREETYPE_LICENSE_FILES = docs/FTL.TXT docs/GPLv2.TXT
 FREETYPE_DEPENDENCIES = host-pkgconf \
 	$(if $(BR2_PACKAGE_ZLIB),zlib) \
 	$(if $(BR2_PACKAGE_BZIP2),bzip2)
-- 
1.7.8.6
