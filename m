From: Martin Bark <martin@barkynet.com>
Date: Thu, 10 Mar 2016 13:26:07 +0000
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump version to 5.8.0
Message-ID: <1457616367-18827-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://nodejs.org/en/blog/release/v5.8.0/

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 .../0001-Remove-dependency-on-Python-bz2-module.patch                 | 0
 .../{5.7.1 => 5.8.0}/0002-gyp-force-link-command-to-use-CXX.patch     | 0
 package/nodejs/{5.7.1 => 5.8.0}/0003-Fix-va_list-not-declared.patch   | 0
 package/nodejs/{5.7.1 => 5.8.0}/0004-Fix-support-for-uClibc-ng.patch  | 0
 package/nodejs/Config.in                                              | 2 +-
 package/nodejs/nodejs.hash                                            | 4 ++--
 6 files changed, 3 insertions(+), 3 deletions(-)
 rename package/nodejs/{5.7.1 => 5.8.0}/0001-Remove-dependency-on-Python-bz2-module.patch (100%)
 rename package/nodejs/{5.7.1 => 5.8.0}/0002-gyp-force-link-command-to-use-CXX.patch (100%)
 rename package/nodejs/{5.7.1 => 5.8.0}/0003-Fix-va_list-not-declared.patch (100%)
 rename package/nodejs/{5.7.1 => 5.8.0}/0004-Fix-support-for-uClibc-ng.patch (100%)

diff --git a/package/nodejs/5.7.1/0001-Remove-dependency-on-Python-bz2-module.patch b/package/nodejs/5.8.0/0001-Remove-dependency-on-Python-bz2-module.patch
similarity index 100%
rename from package/nodejs/5.7.1/0001-Remove-dependency-on-Python-bz2-module.patch
rename to package/nodejs/5.8.0/0001-Remove-dependency-on-Python-bz2-module.patch
diff --git a/package/nodejs/5.7.1/0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/5.8.0/0002-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/5.7.1/0002-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/5.8.0/0002-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/5.7.1/0003-Fix-va_list-not-declared.patch b/package/nodejs/5.8.0/0003-Fix-va_list-not-declared.patch
similarity index 100%
rename from package/nodejs/5.7.1/0003-Fix-va_list-not-declared.patch
rename to package/nodejs/5.8.0/0003-Fix-va_list-not-declared.patch
diff --git a/package/nodejs/5.7.1/0004-Fix-support-for-uClibc-ng.patch b/package/nodejs/5.8.0/0004-Fix-support-for-uClibc-ng.patch
similarity index 100%
rename from package/nodejs/5.7.1/0004-Fix-support-for-uClibc-ng.patch
rename to package/nodejs/5.8.0/0004-Fix-support-for-uClibc-ng.patch
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 02ce219..d200bbb 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -43,7 +43,7 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
-	default "5.7.1"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
+	default "5.8.0"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	default "0.10.43"
 
 menu "Module Selection"
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index b079060..2e8dab8 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
 # From upstream URL: http://nodejs.org/dist/v0.10.43/SHASUMS256.txt
 sha256  6c5185cbfad3538484c9d97eec0110b5cd5826126f15b776015dfee1f51cd32a  node-v0.10.43.tar.xz
 
-# From upstream URL: http://nodejs.org/dist/v5.7.1/SHASUMS256.txt
-sha256  029ed8aeb997c68d1a901cd837af02d24b6b5e20a4ff93bed090fd289f91a9a1  node-v5.7.1.tar.xz
+# From upstream URL: http://nodejs.org/dist/v5.8.0/SHASUMS256.txt
+sha256  c1246d473d6650ca02ab168eaf840e9edda82a4190ff08165fc44a7b381a9361  node-v5.8.0.tar.xz
-- 
2.5.0
