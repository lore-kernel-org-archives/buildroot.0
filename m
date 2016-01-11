From: Davide Viti <zinosat@tiscali.it>
Date: Mon, 11 Jan 2016 20:26:04 +0100
Subject: [Buildroot] [PATCH 1/1] mongoose: bump to version 6.2
Message-ID: <1452540364-5296-1-git-send-email-zinosat@tiscali.it>
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
-- 
2.1.4
