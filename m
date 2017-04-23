From: Davide Viti <zinosat@tiscali.it>
Date: Sun, 23 Apr 2017 22:33:10 +0200
Subject: [Buildroot] [PATCH 1/1] mongoose: bump to version 6.7
Message-ID: <20170423203310.30473-1-zinosat@tiscali.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Davide Viti <zinosat@tiscali.it>
---
 package/mongoose/mongoose.hash | 2 +-
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index c131e48c4..d5252eb68 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	94b934da083afe8abb1c0af5abb8f25294050011793f048166b12f000f9433a0  mongoose-6.2.tar.gz
+sha256	ccc971298db70963d3f13766c3246a3c36ae7e388acfab7ba2180149d9c8c64f  mongoose-6.7.tar.gz
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index ad8b08c65..36fd8f899 100644
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
-- 
2.11.0
