From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 18:11:09 +0200
Subject: [Buildroot] [git commit] package/nodejs: bump version to 8.12.0
Message-ID: <20180912161010.9F22D8444B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e75d9c6bcf4349c75ee958150d0acf70e7da1df3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://nodejs.org/en/blog/release/v8.12.0/

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 8285172215..70d67730b1 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From http://nodejs.org/dist/v8.11.4/SHASUMS256.txt
-sha256 fbce7de6d96b0bcb0db0bf77f0e6ea999b6755e6930568aedaab06847552a609  node-v8.11.4.tar.xz
+# From https://nodejs.org/dist/v8.12.0/SHASUMS256.txt
+sha256 5a9dff58016c18fb4bf902d963b124ff058a550ebcd9840c677757387bce419a  node-v8.12.0.tar.xz
 
 # Hash for license file
 sha256 b87be6c1479ed977481115869c2dd8b6d59e5ea55aa09939d6c898242121b2f5  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 165f3f109a..f9a604f747 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 8.11.4
+NODEJS_VERSION = 8.12.0
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
