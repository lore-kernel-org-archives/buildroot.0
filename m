From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  4 Feb 2021 23:25:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/libcurl: bump version to 7.75.0
Message-ID: <20210204222525.954529-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated license hash due to copyright year bump:
https://github.com/curl/curl/commit/275c28e6502e1ded6c62b5bf22a409de16b4a04e

Changelog: https://curl.se/changes.html

Release notes:
https://daniel.haxx.se/blog/2021/02/03/curl-7-75-0-is-smaller/
"No new security advisories this time!"

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libcurl/libcurl.hash | 6 +++---
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 8e851bb90a..368b8f67f1 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.haxx.se/download/curl-7.74.0.tar.xz.asc
+# https://curl.haxx.se/download/curl-7.75.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  999d5f2c403cf6e25d58319fdd596611e455dd195208746bc6e6d197a77e878b  curl-7.74.0.tar.xz
-sha256  db3c4a3b3695a0f317a0c5176acd2f656d18abc45b3ee78e50935a78eb1e132e  COPYING
+sha256  fe0c49d8468249000bda75bcfdf9e30ff7e9a86d35f1a21f428d79c389d55675  curl-7.75.0.tar.xz
+sha256  6fd1a1c008b5ef4c4741dd188c3f8af6944c14c25afa881eb064f98fb98358e7  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 4d75d05f27..6a9a5a3d3e 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.74.0
+LIBCURL_VERSION = 7.75.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.29.2
