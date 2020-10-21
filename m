From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 21 Oct 2020 16:16:12 +0300
Subject: [Buildroot] [PATCH] package/libcurl: bump to version 7.73.0
Message-ID: <cca867cd64f14b5624b1666067ab98dfbe744702.1603286172.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 2bd1890caf90..332614d82080 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.haxx.se/download/curl-7.72.0.tar.xz.asc
+# https://curl.haxx.se/download/curl-7.73.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  0ded0808c4d85f2ee0db86980ae610cc9d165e9ca9da466196cc73c346513713  curl-7.72.0.tar.xz
+sha256  7c4c7ca4ea88abe00fea4740dcf81075c031b1d0bb23aff2d5efde20a3c2408a  curl-7.73.0.tar.xz
 sha256  db3c4a3b3695a0f317a0c5176acd2f656d18abc45b3ee78e50935a78eb1e132e  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index ea7e06e27ebb..74ce3be654a0 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.72.0
+LIBCURL_VERSION = 7.73.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.28.0
