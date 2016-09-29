From: Martin Bark <martin@barkynet.com>
Date: Thu, 29 Sep 2016 20:12:45 +0100
Subject: [Buildroot] [PATCH 1/2] package/nodejs: bump version to 0.10.47
Message-ID: <1475176366-30034-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://nodejs.org/en/blog/release/v0.10.47/

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 .../{0.10.45 => 0.10.47}/0001-remove-python-bz2-dependency.patch      | 0
 .../{0.10.45 => 0.10.47}/0002-gyp-force-link-command-to-use-CXX.patch | 0
 .../{0.10.45 => 0.10.47}/0003-fix-musl-USE-MISC-build-issue.patch     | 0
 .../nodejs/{0.10.45 => 0.10.47}/0004-Fix-support-for-uClibc-ng.patch  | 0
 package/nodejs/Config.in                                              | 2 +-
 package/nodejs/nodejs.hash                                            | 4 ++--
 6 files changed, 3 insertions(+), 3 deletions(-)
 rename package/nodejs/{0.10.45 => 0.10.47}/0001-remove-python-bz2-dependency.patch (100%)
 rename package/nodejs/{0.10.45 => 0.10.47}/0002-gyp-force-link-command-to-use-CXX.patch (100%)
 rename package/nodejs/{0.10.45 => 0.10.47}/0003-fix-musl-USE-MISC-build-issue.patch (100%)
 rename package/nodejs/{0.10.45 => 0.10.47}/0004-Fix-support-for-uClibc-ng.patch (100%)

diff --git a/package/nodejs/0.10.45/0001-remove-python-bz2-dependency.patch b/package/nodejs/0.10.47/0001-remove-python-bz2-dependency.patch
similarity index 100%
rename from package/nodejs/0.10.45/0001-remove-python-bz2-dependency.patch
rename to package/nodejs/0.10.47/0001-remove-python-bz2-dependency.patch
diff --git a/package/nodejs/0.10.45/0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/0.10.47/0002-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/0.10.45/0002-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/0.10.47/0002-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/0.10.45/0003-fix-musl-USE-MISC-build-issue.patch b/package/nodejs/0.10.47/0003-fix-musl-USE-MISC-build-issue.patch
similarity index 100%
rename from package/nodejs/0.10.45/0003-fix-musl-USE-MISC-build-issue.patch
rename to package/nodejs/0.10.47/0003-fix-musl-USE-MISC-build-issue.patch
diff --git a/package/nodejs/0.10.45/0004-Fix-support-for-uClibc-ng.patch b/package/nodejs/0.10.47/0004-Fix-support-for-uClibc-ng.patch
similarity index 100%
rename from package/nodejs/0.10.45/0004-Fix-support-for-uClibc-ng.patch
rename to package/nodejs/0.10.47/0004-Fix-support-for-uClibc-ng.patch
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index da9ca7f..b591b59 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -44,7 +44,7 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
 	default "6.2.1"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
-	default "0.10.45"
+	default "0.10.47"
 
 config BR2_PACKAGE_NODEJS_NPM
 	bool "NPM for the target"
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 9fce2f5..97f2755 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From upstream URL: http://nodejs.org/dist/v0.10.45/SHASUMS256.txt
-sha256  a71070ea7aece9c94450b45102f2d1be42f0add168dd9c9701e9032d363bd4fa  node-v0.10.45.tar.xz
+# From upstream URL: http://nodejs.org/dist/v0.10.47/SHASUMS256.txt
+sha256  335bdf4db702885a8acaf2c9f241c70cabd62497361da81aca65c8e8a8e7ff09  node-v0.10.47.tar.xz
 
 # From upstream URL: http://nodejs.org/dist/v6.2.1/SHASUMS256.txt
 sha256  dbaeb8fb68a599e5164b17c74f66d24f424ee4ab3a25d8de8a3c6808e5b42bfb  node-v6.2.1.tar.xz
-- 
2.7.4
