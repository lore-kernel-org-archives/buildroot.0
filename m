From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 10:17:42 +0100
Subject: [Buildroot] [PATCH] package/libcurl: bump to version 7.64.1
Message-ID: <20190327091742.4959-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Contains a number of fixes for issues discovered post-7.64.0.  For details,
see the list of changes:

https://curl.haxx.se/changes.html#7_64_1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index b158600eca..d321adcd62 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.haxx.se/download/curl-7.64.0.tar.xz.asc
+# https://curl.haxx.se/download/curl-7.64.1.tar.xz.asc
 # with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256 2f2f13fa34d44aa29cb444077ad7dc4dc6d189584ad552e0aaeb06e608af6001  curl-7.64.0.tar.xz
+sha256 9252332a7f871ce37bfa7f78bdd0a0e3924d8187cc27cb57c76c9474a7168fb3  curl-7.64.1.tar.xz
 sha256 8c8824f50e73a021f5dde1fccbf69685939247399a33a32abab1fa448c9ddabb  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 509dbdb54e..852054a4bd 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.64.0
+LIBCURL_VERSION = 7.64.1
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.11.0
