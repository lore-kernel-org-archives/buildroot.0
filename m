From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Feb 2016 21:52:01 +0100
Subject: [Buildroot] [git commit branch/next] package/nodejs: bump version
	to 5.6.0
Message-ID: <20160216205212.8BC0981839@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b88c1d149df5c1b783407365a24dc6efc497f7cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This is an important security release. See
https://nodejs.org/en/blog/release/v5.6.0/ for further details

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Remove-dependency-on-Python-bz2-module.patch                 | 0
 .../{5.5.0 => 5.6.0}/0002-gyp-force-link-command-to-use-CXX.patch     | 0
 .../0003-Use-a-python-variable-instead-of-hardcoding-Python.patch     | 0
 package/nodejs/{5.5.0 => 5.6.0}/0004-Fix-va_list-not-declared.patch   | 0
 package/nodejs/{5.5.0 => 5.6.0}/0005-Fix-support-for-uClibc-ng.patch  | 0
 package/nodejs/Config.in                                              | 2 +-
 package/nodejs/nodejs.hash                                            | 4 ++--
 7 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/5.5.0/0001-Remove-dependency-on-Python-bz2-module.patch b/package/nodejs/5.6.0/0001-Remove-dependency-on-Python-bz2-module.patch
similarity index 100%
rename from package/nodejs/5.5.0/0001-Remove-dependency-on-Python-bz2-module.patch
rename to package/nodejs/5.6.0/0001-Remove-dependency-on-Python-bz2-module.patch
diff --git a/package/nodejs/5.5.0/0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/5.6.0/0002-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/5.5.0/0002-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/5.6.0/0002-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/5.5.0/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch b/package/nodejs/5.6.0/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
similarity index 100%
rename from package/nodejs/5.5.0/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
rename to package/nodejs/5.6.0/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
diff --git a/package/nodejs/5.5.0/0004-Fix-va_list-not-declared.patch b/package/nodejs/5.6.0/0004-Fix-va_list-not-declared.patch
similarity index 100%
rename from package/nodejs/5.5.0/0004-Fix-va_list-not-declared.patch
rename to package/nodejs/5.6.0/0004-Fix-va_list-not-declared.patch
diff --git a/package/nodejs/5.5.0/0005-Fix-support-for-uClibc-ng.patch b/package/nodejs/5.6.0/0005-Fix-support-for-uClibc-ng.patch
similarity index 100%
rename from package/nodejs/5.5.0/0005-Fix-support-for-uClibc-ng.patch
rename to package/nodejs/5.6.0/0005-Fix-support-for-uClibc-ng.patch
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index cdf7705..bec0eee 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -43,7 +43,7 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
-	default "5.5.0"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
+	default "5.6.0"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	default "0.10.41"
 
 menu "Module Selection"
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index e65f14a..ccad648 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
 # From upstream URL: http://nodejs.org/dist/v0.10.41/SHASUMS256.txt
 sha256	79f694e2a5c42543b75d0c69f6860499d7593136d0f6b59e7163b9e66fb2c995  node-v0.10.41.tar.gz
 
-# From upstream URL: http://nodejs.org/dist/v5.5.0/SHASUMS256.txt
-sha256  9c46b4dc9548e43826f71f6571f56e39783c456b9516045b496ea73321731e22  node-v5.5.0.tar.xz
+# From upstream URL: http://nodejs.org/dist/v5.6.0/SHASUMS256.txt
+sha256  588341e466ac72f6b8e9fa500f04edf149f7d4e8141c4175c495d6d1484405e3  node-v5.6.0.tar.xz
