From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Jul 2019 22:40:02 +0200
Subject: [Buildroot] [git commit] package/libcurl: bump to version 7.65.3
Message-ID: <20190728203958.4BBDD83921@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3fac250944563491b327990eb909617c4f02bd81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A very small fix for the progress meter regression in 7.65.2.

See https://curl.haxx.se/mail/lib-2019-07/0052.html

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 0ee0b0f088..580a2e640a 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.haxx.se/download/curl-7.65.2.tar.xz.asc
+# https://curl.haxx.se/download/curl-7.65.3.tar.xz.asc
 # with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256 b6124b68ed56172012f767a9ea36d3b8ed45adafe7953bd11add66ae6f9d8a39  curl-7.65.2.tar.xz
+sha256 f2d98854813948d157f6a91236ae34ca4a1b4cb302617cebad263d79b0235fea  curl-7.65.3.tar.xz
 sha256 8c8824f50e73a021f5dde1fccbf69685939247399a33a32abab1fa448c9ddabb  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 1819c022f0..8bb215381c 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.65.2
+LIBCURL_VERSION = 7.65.3
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
