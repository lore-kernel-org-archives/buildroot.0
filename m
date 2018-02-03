From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Feb 2018 20:31:13 +0100
Subject: [Buildroot] [git commit] ustr: bump debian patch to 1.0.4-6
Message-ID: <20180203193229.8EA238621E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=973b1fd0891e30cbf3557ae659b1d69af84ebc39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 1.0.4-5 is no longer available, replace with 1.0.4-6 so ustr can
continue to be built.

[Peter: use snapshot.debian.org as suggested by Baruch]
Signed-off-by: Andrey Yurovsky <yurovsky@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
index 6fca33457e..8346adbcf2 100644
--- a/package/ustr/ustr.mk
+++ b/package/ustr/ustr.mk
@@ -13,7 +13,7 @@ USTR_LICENSE = BSD-2-Clause, MIT, LGPL-2.0+
 USTR_LICENSE_FILES = LICENSE LICENSE_BSD LICENSE_LGPL LICENSE_MIT
 USTR_AUTORECONF = YES
 USTR_PATCH = \
-	http://http.debian.net/debian/pool/main/u/ustr/ustr_$(USTR_VERSION)-5.debian.tar.xz
+	http://snapshot.debian.org/archive/debian/20180131T223129Z/pool/main/u/ustr/ustr_$(USTR_VERSION)-6.debian.tar.xz
 
 USTR_INSTALL_STAGING = YES
 
