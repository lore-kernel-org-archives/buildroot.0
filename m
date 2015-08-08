From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:33 -0000
Subject: [Buildroot] [git commit branch/next] package/nodejs: version bump
	to 0.12.7
Message-ID: <20150808105628.7ABCA7FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d082f1390c08bad9cc6ceb6c96039fc6aa8dd3d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...01-Remove-dependency-on-Python-bz2-module.patch |    0
 .../0002-gyp-force-link-command-to-use-CXX.patch   |    0
 ...hon-variable-instead-of-hardcoding-Python.patch |    0
 ...4-fix-build-error-without-OpenSSL-support.patch |    0
 package/nodejs/Config.in                           |    4 ++--
 package/nodejs/nodejs.hash                         |    4 ++--
 6 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nodejs/0.12.6/0001-Remove-dependency-on-Python-bz2-module.patch b/package/nodejs/0.12.7/0001-Remove-dependency-on-Python-bz2-module.patch
similarity index 100%
rename from package/nodejs/0.12.6/0001-Remove-dependency-on-Python-bz2-module.patch
rename to package/nodejs/0.12.7/0001-Remove-dependency-on-Python-bz2-module.patch
diff --git a/package/nodejs/0.12.6/0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/0.12.7/0002-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/0.12.6/0002-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/0.12.7/0002-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/0.12.6/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch b/package/nodejs/0.12.7/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
similarity index 100%
rename from package/nodejs/0.12.6/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
rename to package/nodejs/0.12.7/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
diff --git a/package/nodejs/0.12.6/0004-fix-build-error-without-OpenSSL-support.patch b/package/nodejs/0.12.7/0004-fix-build-error-without-OpenSSL-support.patch
similarity index 100%
rename from package/nodejs/0.12.6/0004-fix-build-error-without-OpenSSL-support.patch
rename to package/nodejs/0.12.7/0004-fix-build-error-without-OpenSSL-support.patch
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index ff7f56c..0838729 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -34,7 +34,7 @@ config BR2_BR2_PACKAGE_NODEJS_0_10_X
 
 # V8 included with v0.12.5 requires at least ARMv6
 config BR2_BR2_PACKAGE_NODEJS_0_12_X
-	bool "v0.12.6"
+	bool "v0.12.7"
 	depends on !BR2_ARM_CPU_ARMV5
 
 endchoice
@@ -42,7 +42,7 @@ endchoice
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
 	default "0.10.39"	if BR2_BR2_PACKAGE_NODEJS_0_10_X
-	default "0.12.6"	if BR2_BR2_PACKAGE_NODEJS_0_12_X
+	default "0.12.7"	if BR2_BR2_PACKAGE_NODEJS_0_12_X
 
 menu "Module Selection"
 
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index f3b2831..8cd670e 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
 # From upstream URL: http://nodejs.org/dist/v0.10.39/SHASUMS256.txt
 sha256	68f8d8f9515c4e77e2a06034b742e19e9848c1fee5bcadedc1d68f3e4302df37  node-v0.10.39.tar.gz
 
-# From upstream URL: http://nodejs.org/dist/v0.12.6/SHASUMS256.txt
-sha256	7a3b5ac351973a9dee8edbf0684bc8d0dea44b231e42274ffb008141ffa19ad2  node-v0.12.6.tar.gz
+# From upstream URL: http://nodejs.org/dist/v0.12.7/SHASUMS256.txt
+sha256	b23d64df051c9c969b0c583f802d5d71de342e53067127a5061415be7e12f39d  node-v0.12.7.tar.gz
