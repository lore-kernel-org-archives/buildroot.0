From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sun, 16 Jun 2019 00:54:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/mongoose: bump to version 6.15
Message-ID: <1560639244-18856-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://github.com/cesanta/mongoose/releases/tag/6.15

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/mongoose/mongoose.hash | 2 +-
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index 86ebe8e..92f35a7 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	ec7956b8f2845f6c22e19ab38a0c32c9b379087f0038c7db661b34812f225911  mongoose-6.13.tar.gz
+sha256	ed9b44690f9660d25562e45472d486c086bcc916bf49f39f22e0a90444d44454  mongoose-6.15.tar.gz
 sha256	fdc34eeea97327d75c83492abd34f1a3200c53dec04422ecda8071dc60a36d10  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 653c83c..c4a703d 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 6.13
+MONGOOSE_VERSION = 6.15
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
-- 
2.7.4
