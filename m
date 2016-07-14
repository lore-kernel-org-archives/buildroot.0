From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Jul 2016 12:53:50 +0200
Subject: [Buildroot] [git commit] freetype: bump to version 2.6.5
Message-ID: <20160714105401.7B5E382231@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=492bd62212169a36a5e2bff034efddfa7d55160f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to savannah download site since sourceforge is acting funny.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freetype/freetype.hash | 5 ++---
 package/freetype/freetype.mk   | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index 8695f26..3d8c225 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,3 +1,2 @@
-# From http://sourceforge.net/projects/freetype/files/freetype2/2.6.4/
-md5 9c3b2258757a19cdba46d34ed1b0852a  freetype-2.6.4.tar.bz2
-sha1 5eaa8c949b4841eeabba44d2c582ff6859e5c4b9  freetype-2.6.4.tar.bz2
+# Locally calculated after checking pgp signature
+sha256	e20a6e1400798fd5e3d831dd821b61c35b1f9a6465d6b18a53a9df4cf441acf0	freetype-2.6.5.tar.bz2
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index d2dbe5f..78e81dd 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.6.4
+FREETYPE_VERSION = 2.6.5
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
-FREETYPE_SITE = http://downloads.sourceforge.net/project/freetype/freetype2/$(FREETYPE_VERSION)
+FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
 FREETYPE_MAKE_OPTS = CCexe="$(HOSTCC)"
 FREETYPE_LICENSE = Dual FTL/GPLv2+
