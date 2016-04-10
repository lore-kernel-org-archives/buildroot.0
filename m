From: Martin Bark <martin@barkynet.com>
Date: Sun, 10 Apr 2016 02:09:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump version to 5.10.1
Message-ID: <1460250567-14254-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://nodejs.org/en/blog/release/v5.10.1/

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 .../0001-Remove-dependency-on-Python-bz2-module.patch                 | 0
 .../{5.9.1 => 5.10.1}/0002-gyp-force-link-command-to-use-CXX.patch    | 0
 package/nodejs/{5.9.1 => 5.10.1}/0003-Fix-va_list-not-declared.patch  | 0
 package/nodejs/{5.9.1 => 5.10.1}/0004-Fix-support-for-uClibc-ng.patch | 0
 package/nodejs/Config.in                                              | 2 +-
 package/nodejs/nodejs.hash                                            | 4 ++--
 6 files changed, 3 insertions(+), 3 deletions(-)
 rename package/nodejs/{5.9.1 => 5.10.1}/0001-Remove-dependency-on-Python-bz2-module.patch (100%)
 rename package/nodejs/{5.9.1 => 5.10.1}/0002-gyp-force-link-command-to-use-CXX.patch (100%)
 rename package/nodejs/{5.9.1 => 5.10.1}/0003-Fix-va_list-not-declared.patch (100%)
 rename package/nodejs/{5.9.1 => 5.10.1}/0004-Fix-support-for-uClibc-ng.patch (100%)

diff --git a/package/nodejs/5.9.1/0001-Remove-dependency-on-Python-bz2-module.patch b/package/nodejs/5.10.1/0001-Remove-dependency-on-Python-bz2-module.patch
similarity index 100%
rename from package/nodejs/5.9.1/0001-Remove-dependency-on-Python-bz2-module.patch
rename to package/nodejs/5.10.1/0001-Remove-dependency-on-Python-bz2-module.patch
diff --git a/package/nodejs/5.9.1/0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/5.10.1/0002-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/5.9.1/0002-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/5.10.1/0002-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/5.9.1/0003-Fix-va_list-not-declared.patch b/package/nodejs/5.10.1/0003-Fix-va_list-not-declared.patch
similarity index 100%
rename from package/nodejs/5.9.1/0003-Fix-va_list-not-declared.patch
rename to package/nodejs/5.10.1/0003-Fix-va_list-not-declared.patch
diff --git a/package/nodejs/5.9.1/0004-Fix-support-for-uClibc-ng.patch b/package/nodejs/5.10.1/0004-Fix-support-for-uClibc-ng.patch
similarity index 100%
rename from package/nodejs/5.9.1/0004-Fix-support-for-uClibc-ng.patch
rename to package/nodejs/5.10.1/0004-Fix-support-for-uClibc-ng.patch
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index dd69a74..69d7f9b 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -43,7 +43,7 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
-	default "5.9.1"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
+	default "5.10.1"	if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	default "0.10.43"
 
 menu "Module Selection"
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 342e87f..c42b6be 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
 # From upstream URL: http://nodejs.org/dist/v0.10.43/SHASUMS256.txt
 sha256  6c5185cbfad3538484c9d97eec0110b5cd5826126f15b776015dfee1f51cd32a  node-v0.10.43.tar.xz
 
-# From upstream URL: http://nodejs.org/dist/v5.9.1/SHASUMS256.txt
-sha256  668067077dfceb3d2039d0df693fec6aa20b920d01a42b53dc61d4aa91e0ae55  node-v5.9.1.tar.xz
+# From upstream URL: http://nodejs.org/dist/v5.10.1/SHASUMS256.txt
+sha256  9eecd853cdd06ebee24a1bb8d753cd20af5a19297c5d3a3b1680fe36b47d5cbe  node-v5.10.1.tar.xz
-- 
2.5.0
