From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 10:43:13 +0200
Subject: [Buildroot] [git commit] package/nodejs: bump version to 8.1.2
Message-ID: <20170620084242.B5A7480789@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de2c85cec6b78b9bd32e6799f9c4c399ceb3dc50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://nodejs.org/en/blog/release/v8.1.2/

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 0246ce0..989616c 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,2 +1,2 @@
-# From upstream URL: http://nodejs.org/dist/v8.0.0/SHASUMS256.txt
-sha256  258d3aa3632bbbf2a447c5d524bd7074e23aa26e2b698774ff452954f6174f1c  node-v8.0.0.tar.xz
+# From upstream URL: http://nodejs.org/dist/v8.1.2/SHASUMS256.txt
+sha256  ac190c1964ee0c28d4c163c0ccbb47435b2e4bd9b4c065b74a93373105c574b3  node-v8.1.2.tar.xz
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 90ca722..c757b25 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 8.0.0
+NODEJS_VERSION = 8.1.2
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs zlib \
