From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Dec 2012 11:55:28 +0100
Subject: [Buildroot] [git commit] freetype: fix legal-info
Message-ID: <20121228105529.BBE939A4D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=141314d38a9b8b007d338dc1caf2c6b0ccd14a9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

My mistake, wrong capitalization, fixes
http://autobuild.buildroot.net/results/10261b94d95f7547a08d8fa1d0b0ddcae85c38a3

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
