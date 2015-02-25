From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Feb 2015 09:07:32 -0300
Subject: [Buildroot] [PATCH] libcurl: bump to version 7.41.0
Message-ID: <1424866052-7228-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcurl/libcurl.hash | 2 +-
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 546ad3a..3b00f0d 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	899109eb3900fa6b8a2f995df7f449964292776a04763e94fae640700f883fba	curl-7.40.0.tar.bz2
+sha256	9f8b546bdc5c57d959151acae7ce6610fe929d82b8d0fc5b25a3a2296e5f8bea	curl-7.41.0.tar.bz2
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 014c5e3..69cd8df 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.40.0
+LIBCURL_VERSION = 7.41.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.0.5
