From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Nov 2015 13:06:15 +0100
Subject: [Buildroot] [git commit] freetype: bump to version 2.6.2
Message-ID: <20151201232124.DB21E821F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=76a861290416532cb1c5b5191d2b064091bc1c8c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freetype/freetype.hash | 6 +++---
 package/freetype/freetype.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index d857a38..dc238f2 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/freetype/files/freetype2/2.6.1/
-md5 35cb8f4d9e5906847901bb39324c2f80  freetype-2.6.1.tar.bz2
-sha1 393447fbf64c107b20a1ccc9e9a9a52f39786ae0  freetype-2.6.1.tar.bz2
+# From http://sourceforge.net/projects/freetype/files/freetype2/2.6.2/
+md5 86109d0c998787d81ac582bad9adf82e  freetype-2.6.2.tar.bz2
+sha1 29c22b85b77cb22cf95c13e7062e21f39fe6b17a  freetype-2.6.2.tar.bz2
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 1fb5b8f..fa11b0c 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.6.1
+FREETYPE_VERSION = 2.6.2
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_SITE = http://downloads.sourceforge.net/project/freetype/freetype2/$(FREETYPE_VERSION)
 FREETYPE_INSTALL_STAGING = YES
