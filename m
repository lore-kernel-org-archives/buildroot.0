From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 30 Mar 2013 20:44:58 +0100
Subject: [Buildroot] [git commit] libarchive: update to 3.0.4
Message-ID: <20130330194754.829B69B3BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=db5db3486f0f6e3113ffc890b2076e4534d4ee69
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Tilman Keskin??z <arved@arved.at>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libarchive/Config.in     |    2 +-
 package/libarchive/libarchive.mk |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libarchive/Config.in b/package/libarchive/Config.in
index 38928b0..a60b50c 100644
--- a/package/libarchive/Config.in
+++ b/package/libarchive/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBARCHIVE
 	  Libarchive is a reusable C library for reading and writing a
 	  variety of streaming archive formats.
 
-	  http://code.google.com/p/libarchive/
+	  http://www.libarchive.org/
 
 comment "libarchive requires a toolchain with WCHAR support"
 	depends on !BR2_USE_WCHAR
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index d25f7f8..c00bc7b 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -3,8 +3,8 @@
 # libarchive (reusable C library for archive formats)
 #
 #############################################################
-LIBARCHIVE_VERSION = 2.8.5
-LIBARCHIVE_SITE = http://libarchive.googlecode.com/files/
+LIBARCHIVE_VERSION = 3.0.4
+LIBARCHIVE_SITE = http://github.com/downloads/libarchive/libarchive
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.gz
 LIBARCHIVE_INSTALL_STAGING = YES
 
