From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 21:03:23 +0100
Subject: [Buildroot] [git commit] package/nodejs: bump version to 0.10.43
Message-ID: <20160308200328.63B6980567@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d51ab07a17e85a0b2c6e7afa6de85c11563638e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://nodejs.org/en/blog/release/v0.10.43/

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../{0.10.42 => 0.10.43}/0001-remove-python-bz2-dependency.patch      | 0
 .../{0.10.42 => 0.10.43}/0002-gyp-force-link-command-to-use-CXX.patch | 0
 .../{0.10.42 => 0.10.43}/0003-fix-musl-USE-MISC-build-issue.patch     | 0
 .../nodejs/{0.10.42 => 0.10.43}/0004-Fix-support-for-uClibc-ng.patch  | 0
 package/nodejs/Config.in                                              | 2 +-
 package/nodejs/nodejs.hash                                            | 4 ++--
 6 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/0.10.42/0001-remove-python-bz2-dependency.patch b/package/nodejs/0.10.43/0001-remove-python-bz2-dependency.patch
similarity index 100%
rename from package/nodejs/0.10.42/0001-remove-python-bz2-dependency.patch
rename to package/nodejs/0.10.43/0001-remove-python-bz2-dependency.patch
diff --git a/package/nodejs/0.10.42/0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/0.10.43/0002-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/0.10.42/0002-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/0.10.43/0002-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/0.10.42/0003-fix-musl-USE-MISC-build-issue.patch b/package/nodejs/0.10.43/0003-fix-musl-USE-MISC-build-issue.patch
similarity index 100%
rename from package/nodejs/0.10.42/0003-fix-musl-USE-MISC-build-issue.patch
rename to package/nodejs/0.10.43/0003-fix-musl-USE-MISC-build-issue.patch
diff --git a/package/nodejs/0.10.42/0004-Fix-support-for-uClibc-ng.patch b/package/nodejs/0.10.43/0004-Fix-support-for-uClibc-ng.patch
similarity index 100%
rename from package/nodejs/0.10.42/0004-Fix-support-for-uClibc-ng.patch
rename to package/nodejs/0.10.43/0004-Fix-support-for-uClibc-ng.patch
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 1bc7372..02ce219 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -44,7 +44,7 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
 	default "5.7.1"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
-	default "0.10.42"
+	default "0.10.43"
 
 menu "Module Selection"
 
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 3a476a3..b079060 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From upstream URL: http://nodejs.org/dist/v0.10.42/SHASUMS256.txt
-sha256  9b4cc1b5bc397d80dfe217625b04bb6212a3b5a8b1e0eb36000a30d7ae567b8a  node-v0.10.42.tar.xz
+# From upstream URL: http://nodejs.org/dist/v0.10.43/SHASUMS256.txt
+sha256  6c5185cbfad3538484c9d97eec0110b5cd5826126f15b776015dfee1f51cd32a  node-v0.10.43.tar.xz
 
 # From upstream URL: http://nodejs.org/dist/v5.7.1/SHASUMS256.txt
 sha256  029ed8aeb997c68d1a901cd837af02d24b6b5e20a4ff93bed090fd289f91a9a1  node-v5.7.1.tar.xz
