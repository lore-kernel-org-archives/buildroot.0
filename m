From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 14 Sep 2016 09:52:24 +0100
Subject: [Buildroot] [PATCH] libcurl: bump version to 7.50.3
Message-ID: <1473843144-21995-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libcurl/libcurl.hash | 2 +-
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index c2b4ecc..e2f2ecd 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 0c72105df4e9575d68bcf43aea1751056c1d29b1040df6194a49c5ac08f8e233  curl-7.50.2.tar.bz2
+sha256 7b7347d976661d02c84a1f4d6daf40dee377efdc45b9e2c77dedb8acf140d8ec  curl-7.50.3.tar.bz2
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 00a61d2..32a3022 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.50.2
+LIBCURL_VERSION = 7.50.3
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.7.3
