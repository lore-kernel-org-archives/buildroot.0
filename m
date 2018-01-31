From: Andrey Yurovsky <yurovsky@gmail.com>
Date: Wed, 31 Jan 2018 11:32:08 -0800
Subject: [Buildroot] [PATCH] ustr: bump debian patch to 1.0.4-6
Message-ID: <20180131193208.2896-1-yurovsky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 1.0.4-5 is no longer available, replace with 1.0.4-6 so ustr can
continue to be built.

Signed-off-by: Andrey Yurovsky <yurovsky@gmail.com>
---
 package/ustr/ustr.hash | 4 ++--
 package/ustr/ustr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ustr/ustr.hash b/package/ustr/ustr.hash
index 214d37a77a..878c607332 100644
--- a/package/ustr/ustr.hash
+++ b/package/ustr/ustr.hash
@@ -1,4 +1,4 @@
 # Locally computed
 sha256 3daf6eae9f78de1e872c0b2b83cce35515b94d4bb8a074e48f331fd99e1fc2c4 ustr-1.0.4.tar.bz2
-# From http://debian.gtisc.gatech.edu/debian/pool/main/u/ustr/ustr_1.0.4-5.dsc
-sha256 a21e78acf82dcccef2893932ef7b85852419bfd9b18382e63c34e7710c1d7762 ustr_1.0.4-5.debian.tar.xz
+# From http://debian.gtisc.gatech.edu/debian/pool/main/u/ustr/ustr_1.0.4-6.dsc
+sha256 75aa6be2c70eba632ac63078e55ecb4b5a45e6624501a8ed6d81b9a2014d149e ustr_1.0.4-6.debian.tar.xz
diff --git a/package/ustr/ustr.mk b/package/ustr/ustr.mk
index 6fca33457e..a2c7a0a320 100644
--- a/package/ustr/ustr.mk
+++ b/package/ustr/ustr.mk
@@ -13,7 +13,7 @@ USTR_LICENSE = BSD-2-Clause, MIT, LGPL-2.0+
 USTR_LICENSE_FILES = LICENSE LICENSE_BSD LICENSE_LGPL LICENSE_MIT
 USTR_AUTORECONF = YES
 USTR_PATCH = \
-	http://http.debian.net/debian/pool/main/u/ustr/ustr_$(USTR_VERSION)-5.debian.tar.xz
+	http://http.debian.net/debian/pool/main/u/ustr/ustr_$(USTR_VERSION)-6.debian.tar.xz
 
 USTR_INSTALL_STAGING = YES
 
-- 
2.14.3
