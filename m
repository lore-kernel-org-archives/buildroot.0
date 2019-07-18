From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Thu, 18 Jul 2019 22:26:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/libcurl: bump to version 7.65.2
Message-ID: <1563481578-14067-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Contains a number of fixes for issues discovered post-7.65.1.
For details, see full changelog:

https://curl.haxx.se/changes.html#7_65_2

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index f5e90e0..0ee0b0f 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.haxx.se/download/curl-7.65.1.tar.xz.asc
+# https://curl.haxx.se/download/curl-7.65.2.tar.xz.asc
 # with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256 f6c22074877f235aebc7c53057dbc7ee82358f8ae58bfb767e955c18c859a77a  curl-7.65.1.tar.xz
+sha256 b6124b68ed56172012f767a9ea36d3b8ed45adafe7953bd11add66ae6f9d8a39  curl-7.65.2.tar.xz
 sha256 8c8824f50e73a021f5dde1fccbf69685939247399a33a32abab1fa448c9ddabb  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index abf7c0b..1819c02 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.65.1
+LIBCURL_VERSION = 7.65.2
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.7.4
