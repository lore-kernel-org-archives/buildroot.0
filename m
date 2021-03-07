From: Francois Perrad <fperrad@gmail.com>
Date: Sun,  7 Mar 2021 12:28:04 +0100
Subject: [Buildroot] [PATCH] package/lzip: bump to version 1.22
Message-ID: <20210307112804.1283062-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lzip/Config.in | 2 +-
 package/lzip/lzip.hash | 4 ++--
 package/lzip/lzip.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lzip/Config.in b/package/lzip/Config.in
index d406e7710..c07ef8d67 100644
--- a/package/lzip/Config.in
+++ b/package/lzip/Config.in
@@ -12,4 +12,4 @@ config BR2_PACKAGE_LZIP
 	  perspective. Lzip is a clean implementation of the LZMA
 	  algorithm.
 
-	  http://www.nongnu.org/lzip/lzip.html
+	  https://www.nongnu.org/lzip/lzip.html
diff --git a/package/lzip/lzip.hash b/package/lzip/lzip.hash
index 35ff7a44a..57e7eb43f 100644
--- a/package/lzip/lzip.hash
+++ b/package/lzip/lzip.hash
@@ -1,4 +1,4 @@
-# From https://lists.nongnu.org/archive/html/lzip-bug/2019-01/msg00010.html
-sha256  e48b5039d3164d670791f9c5dbaa832bf2df080cb1fbb4f33aa7b3300b670d8b  lzip-1.21.tar.gz
+# From https://lists.nongnu.org/archive/html/lzip-bug/2021-01/msg00008.html
+sha256  c3342d42e67139c165b8b128d033b5c96893a13ac5f25933190315214e87a948  lzip-1.22.tar.gz
 # Locally calculated
 sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
index 2a9a079cd..cca6da07d 100644
--- a/package/lzip/lzip.mk
+++ b/package/lzip/lzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LZIP_VERSION = 1.21
+LZIP_VERSION = 1.22
 LZIP_SITE = http://download.savannah.gnu.org/releases/lzip
 LZIP_LICENSE = GPL-2.0+
 LZIP_LICENSE_FILES = COPYING
-- 
2.27.0
