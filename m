From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  8 Feb 2016 16:26:42 -0300
Subject: [Buildroot] [PATCH] libcurl: bump to version 7.47.1
Message-ID: <1454959602-31611-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index cd35d4c..eef2c13 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256	2b096f9387fb9b2be08d17e518c62b6537b1f4d4bb59111d5b4fa0272f383f66	curl-7.47.0.tar.bz2
+# Locally calculated after checking pgp signature
+sha256	ddc643ab9382e24bbe4747d43df189a0a6ce38fcb33df041b9cb0b3cd47ae98f	curl-7.47.1.tar.bz2
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index fb4b5b4..522801a 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.47.0
+LIBCURL_VERSION = 7.47.1
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.4.10
