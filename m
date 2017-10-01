From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Oct 2017 23:12:07 +0200
Subject: [Buildroot] [git commit] package/nodejs: bump version to 8.6.0
Message-ID: <20171001211816.3B8937FF2C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd17abcd569d4349574bc7a4a047268e0adb393e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://nodejs.org/en/blog/release/v8.6.0/

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index c1d1652..3cc77b2 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,2 +1,2 @@
-# From http://nodejs.org/dist/v8.5.0/SHASUMS256.txt
-sha256 e1cde5d8e5049e7e1b61aef128f26162059d885dc8cab5014bf5cbf693f75c3c  node-v8.5.0.tar.xz
+# From http://nodejs.org/dist/v8.6.0/SHASUMS256.txt
+sha256 b17071109238295b9f363b768afdff97a9f386203d4f080c91847ce76d4f7e93  node-v8.6.0.tar.xz
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index fe50393..c1bac35 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 8.5.0
+NODEJS_VERSION = 8.6.0
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
