From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Apr 2016 21:57:54 +0200
Subject: [Buildroot] [git commit] package/nodejs: bump version to 0.10.44
Message-ID: <20160426195757.E7C2C802DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09f2657562829f3d98afa4f6fd1d79ee6c34fc78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://nodejs.org/en/blog/release/v0.10.44/

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../{0.10.43 => 0.10.44}/0001-remove-python-bz2-dependency.patch      | 0
 .../{0.10.43 => 0.10.44}/0002-gyp-force-link-command-to-use-CXX.patch | 0
 .../{0.10.43 => 0.10.44}/0003-fix-musl-USE-MISC-build-issue.patch     | 0
 .../nodejs/{0.10.43 => 0.10.44}/0004-Fix-support-for-uClibc-ng.patch  | 0
 package/nodejs/Config.in                                              | 2 +-
 package/nodejs/nodejs.hash                                            | 4 ++--
 6 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/0.10.43/0001-remove-python-bz2-dependency.patch b/package/nodejs/0.10.44/0001-remove-python-bz2-dependency.patch
similarity index 100%
rename from package/nodejs/0.10.43/0001-remove-python-bz2-dependency.patch
rename to package/nodejs/0.10.44/0001-remove-python-bz2-dependency.patch
diff --git a/package/nodejs/0.10.43/0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/0.10.44/0002-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/0.10.43/0002-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/0.10.44/0002-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/0.10.43/0003-fix-musl-USE-MISC-build-issue.patch b/package/nodejs/0.10.44/0003-fix-musl-USE-MISC-build-issue.patch
similarity index 100%
rename from package/nodejs/0.10.43/0003-fix-musl-USE-MISC-build-issue.patch
rename to package/nodejs/0.10.44/0003-fix-musl-USE-MISC-build-issue.patch
diff --git a/package/nodejs/0.10.43/0004-Fix-support-for-uClibc-ng.patch b/package/nodejs/0.10.44/0004-Fix-support-for-uClibc-ng.patch
similarity index 100%
rename from package/nodejs/0.10.43/0004-Fix-support-for-uClibc-ng.patch
rename to package/nodejs/0.10.44/0004-Fix-support-for-uClibc-ng.patch
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 69d7f9b..268bd92 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -44,7 +44,7 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
 	default "5.10.1"	if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
-	default "0.10.43"
+	default "0.10.44"
 
 menu "Module Selection"
 
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index c42b6be..9be1353 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From upstream URL: http://nodejs.org/dist/v0.10.43/SHASUMS256.txt
-sha256  6c5185cbfad3538484c9d97eec0110b5cd5826126f15b776015dfee1f51cd32a  node-v0.10.43.tar.xz
+# From upstream URL: http://nodejs.org/dist/v0.10.44/SHASUMS256.txt
+sha256  25b2cd910822723e972a3990d5687b7ff48581ad2f77aa1942d99a1b024f434a  node-v0.10.44.tar.xz
 
 # From upstream URL: http://nodejs.org/dist/v5.10.1/SHASUMS256.txt
 sha256  9eecd853cdd06ebee24a1bb8d753cd20af5a19297c5d3a3b1680fe36b47d5cbe  node-v5.10.1.tar.xz
