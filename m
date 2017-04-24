From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 22:28:24 +0200
Subject: [Buildroot] [git commit] mongoose: bump to version 6.7
Message-ID: <20170424203124.0407B827D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=965c5ca57d3a3be9461da8042d91aeaaa477ae21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Davide Viti <zinosat@tiscali.it>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongoose/mongoose.hash | 2 +-
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index c131e48..d5252eb 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	94b934da083afe8abb1c0af5abb8f25294050011793f048166b12f000f9433a0  mongoose-6.2.tar.gz
+sha256	ccc971298db70963d3f13766c3246a3c36ae7e388acfab7ba2180149d9c8c64f  mongoose-6.7.tar.gz
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index ad8b08c..36fd8f8 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 6.2
+MONGOOSE_VERSION = 6.7
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
