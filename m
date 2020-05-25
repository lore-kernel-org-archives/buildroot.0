From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Mon, 25 May 2020 18:24:20 +0200
Subject: [Buildroot] [PATCH/next] package/mongoose: bump to to version 6.18
Message-ID: <1590423860-27841-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://github.com/cesanta/mongoose/releases/tag/6.18

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/mongoose/mongoose.hash | 2 +-
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index c5de11b..b8be69b 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  5bff3cc70bb2248cf87d06a3543f120f3b29b9368d25a7715443cb10612987cc  mongoose-6.17.tar.gz
+sha256  f5c10346abc9c72f7cac7885d853ca064fb09aad57580433941a8fd7a3543769  mongoose-6.18.tar.gz
 sha256  fdc34eeea97327d75c83492abd34f1a3200c53dec04422ecda8071dc60a36d10  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 7944f5e..87f56d7 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 6.17
+MONGOOSE_VERSION = 6.18
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
-- 
2.7.4
