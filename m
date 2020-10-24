From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Oct 2020 22:51:01 +0200
Subject: [Buildroot] [git commit] package/libcurl: bump to version 7.73.0
Message-ID: <20201024203855.91FDE83A2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d0be6577e8df799f94a900975b1db8f7a5be2d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 2bd1890caf..332614d820 100644
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
index ea7e06e27e..74ce3be654 100644
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
