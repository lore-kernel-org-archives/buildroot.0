From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jan 2016 21:36:47 +0100
Subject: [Buildroot] [git commit] mongoose: bump to version 6.2
Message-ID: <20160112204022.9552A8274C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=259a7c58ae7358b64e3c88c6a906d7d027c06b7f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Davide Viti <zinosat@tiscali.it>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongoose/mongoose.hash | 2 +-
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index 1ed4a78..c131e48 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	512b406714d31a178fc41263ca6ecafd0c1e2dd091e9685a7b2462fecdaaea8e  mongoose-6.1.tar.gz
+sha256	94b934da083afe8abb1c0af5abb8f25294050011793f048166b12f000f9433a0  mongoose-6.2.tar.gz
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 6caaf2e..98f6525 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 6.1
+MONGOOSE_VERSION = 6.2
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPLv2
 MONGOOSE_LICENSE_FILES = LICENSE
