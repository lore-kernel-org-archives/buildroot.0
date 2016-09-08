From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  8 Sep 2016 15:26:27 -0300
Subject: [Buildroot] [PATCH] freetype: bump to version 2.7
Message-ID: <1473359187-15233-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/freetype/freetype.hash | 2 +-
 package/freetype/freetype.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index 3d8c225..d56742c 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	e20a6e1400798fd5e3d831dd821b61c35b1f9a6465d6b18a53a9df4cf441acf0	freetype-2.6.5.tar.bz2
+sha256	d6a451f5b754857d2aa3964fd4473f8bc5c64e879b24516d780fb26bec7f7d48	freetype-2.7.tar.bz2
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 78e81dd..8a9a285 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.6.5
+FREETYPE_VERSION = 2.7
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
-- 
2.7.3
