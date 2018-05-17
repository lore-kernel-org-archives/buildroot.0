From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 May 2018 23:55:15 +0200
Subject: [Buildroot] [git commit branch/next] package/nodejs: bump version
 to 8.11.2
Message-ID: <20180517215426.59AA1810B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d4eb844e3f25c96e6e84f69e0c9ee6bd4b5a501
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

See https://nodejs.org/en/blog/release/v8.11.2/

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index b3900f6a7d..25b035d694 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From http://nodejs.org/dist/v8.11.1/SHASUMS256.txt
-sha256 40a6eb51ea37fafcf0cfb58786b15b99152bec672cccf861c14d1cca0ad4758a  node-v8.11.1.tar.xz
+# From http://nodejs.org/dist/v8.11.2/SHASUMS256.txt
+sha256 539946c0381809576bed07424a35fc1740d52f4bd56305d6278d9e76c88f4979  node-v8.11.2.tar.xz
 
 # Hash for license file
 sha256 b87be6c1479ed977481115869c2dd8b6d59e5ea55aa09939d6c898242121b2f5  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 2642525c47..0c7db83012 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 8.11.1
+NODEJS_VERSION = 8.11.2
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
