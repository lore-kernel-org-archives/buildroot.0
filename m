From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Apr 2019 08:42:36 +0200
Subject: [Buildroot] [git commit] package/luasec: bump to version 0.8
Message-ID: <20190417063809.4DCF481DB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff2ad87ad10e79a08ab8b41bc0c2f1630210f90a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

the license file hash changed due to a copyright year update

-LuaSec 0.7 license
-Copyright (C) 2006-2018 Bruno Silvestre, UFG
+LuaSec 0.8 license
+Copyright (C) 2006-2019 Bruno Silvestre, UFG

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luasec/Config.in   | 4 ++--
 package/luasec/luasec.hash | 4 ++--
 package/luasec/luasec.mk   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/luasec/Config.in b/package/luasec/Config.in
index 43527ab09d..d22fd57a6e 100644
--- a/package/luasec/Config.in
+++ b/package/luasec/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LUASEC
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LUASOCKET # runtime
 	help
-	  LuaSec is a binding for OpenSSL library to provide TLS/SSL
-	  communication.
+	  A binding for OpenSSL library to provide TLS/SSL communication
+	  over LuaSocket.
 
 	  https://github.com/brunoos/luasec/wiki
diff --git a/package/luasec/luasec.hash b/package/luasec/luasec.hash
index 37fc08d455..30ef801018 100644
--- a/package/luasec/luasec.hash
+++ b/package/luasec/luasec.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 383e183ba712f00b2fcbf60187177432ccde724a23ac6186075ceae620cf0b0a  luasec-0.7-1.src.rock
-sha256 b310a4c5a9927a43123e3ffcfaa5f5921b545b64d38ea55c7faf2a837547a200  luasec-luasec-0.7/LICENSE
+sha256 3c993af8a392511380bf75f68525b5d1f2c6ecdddd17e72d0b51b39c710fa127  luasec-0.8-1.src.rock
+sha256 93b708a114eb0b1028b0549116361da1d24131b042a2bd434c683c7a504877b8  luasec-luasec-0.8/LICENSE
diff --git a/package/luasec/luasec.mk b/package/luasec/luasec.mk
index 7ae7290937..9ce358753e 100644
--- a/package/luasec/luasec.mk
+++ b/package/luasec/luasec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUASEC_VERSION_UPSTREAM = 0.7
+LUASEC_VERSION_UPSTREAM = 0.8
 LUASEC_VERSION = $(LUASEC_VERSION_UPSTREAM)-1
 LUASEC_SUBDIR = luasec-luasec-$(LUASEC_VERSION_UPSTREAM)
 LUASEC_LICENSE = MIT
