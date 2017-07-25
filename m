From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Jul 2017 15:58:28 +0200
Subject: [Buildroot] [git commit] package/nodejs: bump version to 8.2.1
Message-ID: <20170725144738.37D4B800EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01702b42576533f0acc3d45de9e07d648b4f6aec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://nodejs.org/en/blog/release/v8.2.1/

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 93aa6a1..6a79f02 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,2 +1,2 @@
-# From upstream URL: http://nodejs.org/dist/v8.1.4/SHASUMS256.txt
-sha256  a83c86445f79749c46fd4f2c4e681a3e5bb51b2bde5dc7aed1dc38e4e242c301  node-v8.1.4.tar.xz
+# From upstream URL: http://nodejs.org/dist/v8.2.1/SHASUMS256.txt
+sha256  02c46d8914540eea73d0ad33bf9f371a28aa0dc8c5d740948491fef044ad8c8b  node-v8.2.1.tar.xz
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index bb4f984..3b80371 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 8.1.4
+NODEJS_VERSION = 8.2.1
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
