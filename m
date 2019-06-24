From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Jun 2019 20:39:32 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/mongoose: bump to
 version 6.15
Message-ID: <20190624183832.D3256880E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14fcd2ffbc60a31e6261be705af13e0d0319a52a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

See https://github.com/cesanta/mongoose/releases/tag/6.15

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit da7fdfe6a3f9f1ee9439654e5f4d003fa538f9b2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongoose/mongoose.hash | 2 +-
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index 86ebe8efbf..92f35a7113 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	ec7956b8f2845f6c22e19ab38a0c32c9b379087f0038c7db661b34812f225911  mongoose-6.13.tar.gz
+sha256	ed9b44690f9660d25562e45472d486c086bcc916bf49f39f22e0a90444d44454  mongoose-6.15.tar.gz
 sha256	fdc34eeea97327d75c83492abd34f1a3200c53dec04422ecda8071dc60a36d10  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 653c83c7d4..c4a703d3cf 100644
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
