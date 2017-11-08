From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Nov 2017 19:45:42 +0100
Subject: [Buildroot] [git commit] package/nodejs: bump version to 8.9.1
Message-ID: <20171108183850.3BAA580E50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=582496635cd26678f8c1b9a48b73c0e1d8534d01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://nodejs.org/en/blog/release/v8.9.1/

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 9367c54..658f80b 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,2 +1,2 @@
-# From http://nodejs.org/dist/v8.8.1/SHASUMS256.txt
-sha256 5ce2c47ab779992db49942f757a01cc5131db5cef4e0dd270e48151b0887b57a  node-v8.8.1.tar.xz
+# From http://nodejs.org/dist/v8.9.1/SHASUMS256.txt
+sha256 ef160c21f60f8aca64145985e01b4044435e381dc16e8f0640ed0223e84f17e0  node-v8.9.1.tar.xz
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index a29f572..9cf26da 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 8.8.1
+NODEJS_VERSION = 8.9.1
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
