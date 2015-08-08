From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:33 -0000
Subject: [Buildroot] [git commit branch/next] package/nodejs: version bump
	to 0.10.40
Message-ID: <20150808105632.D0DB68190C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=20ad99535a6a8b5fc6c5f0da7afeae1169affcfd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-remove-python-bz2-dependency.patch        |    0
 .../0002-gyp-force-link-command-to-use-CXX.patch   |    0
 .../0003-use-python-variable.patch                 |    0
 ...4-fix-build-error-without-OpenSSL-support.patch |    0
 package/nodejs/Config.in                           |    4 ++--
 package/nodejs/nodejs.hash                         |    4 ++--
 6 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nodejs/0.10.39/0001-remove-python-bz2-dependency.patch b/package/nodejs/0.10.40/0001-remove-python-bz2-dependency.patch
similarity index 100%
rename from package/nodejs/0.10.39/0001-remove-python-bz2-dependency.patch
rename to package/nodejs/0.10.40/0001-remove-python-bz2-dependency.patch
diff --git a/package/nodejs/0.10.39/0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/0.10.40/0002-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/0.10.39/0002-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/0.10.40/0002-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/0.10.39/0003-use-python-variable.patch b/package/nodejs/0.10.40/0003-use-python-variable.patch
similarity index 100%
rename from package/nodejs/0.10.39/0003-use-python-variable.patch
rename to package/nodejs/0.10.40/0003-use-python-variable.patch
diff --git a/package/nodejs/0.10.39/0004-fix-build-error-without-OpenSSL-support.patch b/package/nodejs/0.10.40/0004-fix-build-error-without-OpenSSL-support.patch
similarity index 100%
rename from package/nodejs/0.10.39/0004-fix-build-error-without-OpenSSL-support.patch
rename to package/nodejs/0.10.40/0004-fix-build-error-without-OpenSSL-support.patch
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 0838729..c5ec792 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -30,7 +30,7 @@ choice
 	  Select the version of Node.js you wish to use.
 
 config BR2_BR2_PACKAGE_NODEJS_0_10_X
-	bool "v0.10.39"
+	bool "v0.10.40"
 
 # V8 included with v0.12.5 requires at least ARMv6
 config BR2_BR2_PACKAGE_NODEJS_0_12_X
@@ -41,7 +41,7 @@ endchoice
 
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
-	default "0.10.39"	if BR2_BR2_PACKAGE_NODEJS_0_10_X
+	default "0.10.40"	if BR2_BR2_PACKAGE_NODEJS_0_10_X
 	default "0.12.7"	if BR2_BR2_PACKAGE_NODEJS_0_12_X
 
 menu "Module Selection"
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 8cd670e..9be2806 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From upstream URL: http://nodejs.org/dist/v0.10.39/SHASUMS256.txt
-sha256	68f8d8f9515c4e77e2a06034b742e19e9848c1fee5bcadedc1d68f3e4302df37  node-v0.10.39.tar.gz
+# From upstream URL: http://nodejs.org/dist/v0.10.40/SHASUMS256.txt
+sha256	bae79c2fd959aebe1629af36077bebbb760128db753da226d2344cd91499149f  node-v0.10.40.tar.gz
 
 # From upstream URL: http://nodejs.org/dist/v0.12.7/SHASUMS256.txt
 sha256	b23d64df051c9c969b0c583f802d5d71de342e53067127a5061415be7e12f39d  node-v0.12.7.tar.gz
