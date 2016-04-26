From: Martin Bark <martin@barkynet.com>
Date: Tue, 26 Apr 2016 11:28:58 +0100
Subject: [Buildroot] [PATCH 2/2] package/nodejs: bump version to 5.11.0
In-Reply-To: <1461666538-32692-1-git-send-email-martin@barkynet.com>
References: <1461666538-32692-1-git-send-email-martin@barkynet.com>
Message-ID: <1461666538-32692-2-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://nodejs.org/en/blog/release/v5.11.0/

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 .../0001-Remove-dependency-on-Python-bz2-module.patch                 | 0
 .../{5.10.1 => 5.11.0}/0002-gyp-force-link-command-to-use-CXX.patch   | 0
 package/nodejs/{5.10.1 => 5.11.0}/0003-Fix-va_list-not-declared.patch | 0
 .../nodejs/{5.10.1 => 5.11.0}/0004-Fix-support-for-uClibc-ng.patch    | 0
 package/nodejs/Config.in                                              | 2 +-
 package/nodejs/nodejs.hash                                            | 4 ++--
 6 files changed, 3 insertions(+), 3 deletions(-)
 rename package/nodejs/{5.10.1 => 5.11.0}/0001-Remove-dependency-on-Python-bz2-module.patch (100%)
 rename package/nodejs/{5.10.1 => 5.11.0}/0002-gyp-force-link-command-to-use-CXX.patch (100%)
 rename package/nodejs/{5.10.1 => 5.11.0}/0003-Fix-va_list-not-declared.patch (100%)
 rename package/nodejs/{5.10.1 => 5.11.0}/0004-Fix-support-for-uClibc-ng.patch (100%)

diff --git a/package/nodejs/5.10.1/0001-Remove-dependency-on-Python-bz2-module.patch b/package/nodejs/5.11.0/0001-Remove-dependency-on-Python-bz2-module.patch
similarity index 100%
rename from package/nodejs/5.10.1/0001-Remove-dependency-on-Python-bz2-module.patch
rename to package/nodejs/5.11.0/0001-Remove-dependency-on-Python-bz2-module.patch
diff --git a/package/nodejs/5.10.1/0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/5.11.0/0002-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/5.10.1/0002-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/5.11.0/0002-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/5.10.1/0003-Fix-va_list-not-declared.patch b/package/nodejs/5.11.0/0003-Fix-va_list-not-declared.patch
similarity index 100%
rename from package/nodejs/5.10.1/0003-Fix-va_list-not-declared.patch
rename to package/nodejs/5.11.0/0003-Fix-va_list-not-declared.patch
diff --git a/package/nodejs/5.10.1/0004-Fix-support-for-uClibc-ng.patch b/package/nodejs/5.11.0/0004-Fix-support-for-uClibc-ng.patch
similarity index 100%
rename from package/nodejs/5.10.1/0004-Fix-support-for-uClibc-ng.patch
rename to package/nodejs/5.11.0/0004-Fix-support-for-uClibc-ng.patch
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 268bd92..c1d8331 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -43,7 +43,7 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
-	default "5.10.1"	if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
+	default "5.11.0"	if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	default "0.10.44"
 
 menu "Module Selection"
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 9be1353..9e7fd30 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
 # From upstream URL: http://nodejs.org/dist/v0.10.44/SHASUMS256.txt
 sha256  25b2cd910822723e972a3990d5687b7ff48581ad2f77aa1942d99a1b024f434a  node-v0.10.44.tar.xz
 
-# From upstream URL: http://nodejs.org/dist/v5.10.1/SHASUMS256.txt
-sha256  9eecd853cdd06ebee24a1bb8d753cd20af5a19297c5d3a3b1680fe36b47d5cbe  node-v5.10.1.tar.xz
+# From upstream URL: http://nodejs.org/dist/v5.11.0/SHASUMS256.txt
+sha256  083766aff72fc5c78f6999dd0d00bc0340a052ab270fd60d6928b719ca2b3fd1  node-v5.11.0.tar.xz
-- 
2.7.4
