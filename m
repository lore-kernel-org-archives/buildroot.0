From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 7 Sep 2016 10:16:08 +0100
Subject: [Buildroot] [PATCH] libcurl: bump version to 7.50.2
Message-ID: <1473239768-26001-1-git-send-email-Vincent.Riera@imgtec.com>
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
index ff0026d..c2b4ecc 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 3c12c5f54ccaa1d40abc65d672107dcc75d3e1fcb38c267484334280096e5156  curl-7.50.1.tar.bz2
+sha256 0c72105df4e9575d68bcf43aea1751056c1d29b1040df6194a49c5ac08f8e233  curl-7.50.2.tar.bz2
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 4a018b8..00a61d2 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.50.1
+LIBCURL_VERSION = 7.50.2
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.7.3
