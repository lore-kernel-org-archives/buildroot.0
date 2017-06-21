From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 21 Jun 2017 16:30:53 -0400
Subject: [Buildroot] [PATCH] libcurl: bump version to 7.54.1
In-Reply-To: <20170621203057.4346-1-aduskett@codeblue.com>
References: <20170621203057.4346-1-aduskett@codeblue.com>
Message-ID: <20170621203057.4346-4-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/libcurl/libcurl.hash | 2 +-
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index f8885e0..1b8d80f 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 f50ebaf43c507fa7cc32be4b8108fa8bbd0f5022e90794388f3c7694a302ff06  curl-7.54.0.tar.bz2
+sha256 fdfc4df2d001ee0c44ec071186e770046249263c491fcae48df0e1a3ca8f25a0  curl-7.54.1.tar.bz2
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 6f4803e..45bd080 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.54.0
+LIBCURL_VERSION = 7.54.1
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.9.4
