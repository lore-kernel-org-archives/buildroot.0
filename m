From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Jul 2020 23:24:25 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/nodejs: bump to
 version 12.16.3
Message-ID: <20200712212910.361F1869AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=441d6b2b96f266a331625ceeba9858be8a3dcde5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b90ab938b83b701073bfd4edd8a6cff2625dcb6c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 992040d391..411b4d52b9 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v12.16.1/SHASUMS256.txt
-sha256  0a95845ba02c46102b5671d0c5732460073f2d397488337e18d1fc30146d412d  node-v12.16.1.tar.xz
+# From https://nodejs.org/dist/v12.16.3/SHASUMS256.txt
+sha256  f0559b0829c7f2ac10bf5b3e157e498227e95e26cdb6af814969c49f367359a3  node-v12.16.3.tar.xz
 
 # Hash for license file
 sha256  3f5749f7a58edaadd77843057a90063a18067f472d8b26c0a76905cafa1063e3  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index e291939981..7abba4e746 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 12.16.1
+NODEJS_VERSION = 12.16.3
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
