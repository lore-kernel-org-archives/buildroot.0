From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 13:54:49 +0200
Subject: [Buildroot] [git commit] freetype: bump version to 2.6.4
Message-ID: <20160706115454.A102A821AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e23692ece811ac11abeeb59337c14d5f79427de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freetype/freetype.hash | 6 +++---
 package/freetype/freetype.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index 45f91df..8695f26 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/freetype/files/freetype2/2.6.3/
-md5	0037b25a8c090bc8a1218e867b32beb1	freetype-2.6.3.tar.bz2
-sha1	6c98bd5d0be313207c37ca23d25faf983486aee5	freetype-2.6.3.tar.bz2
+# From http://sourceforge.net/projects/freetype/files/freetype2/2.6.4/
+md5 9c3b2258757a19cdba46d34ed1b0852a  freetype-2.6.4.tar.bz2
+sha1 5eaa8c949b4841eeabba44d2c582ff6859e5c4b9  freetype-2.6.4.tar.bz2
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index d95c424..d2dbe5f 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.6.3
+FREETYPE_VERSION = 2.6.4
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_SITE = http://downloads.sourceforge.net/project/freetype/freetype2/$(FREETYPE_VERSION)
 FREETYPE_INSTALL_STAGING = YES
