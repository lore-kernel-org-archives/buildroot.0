From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 May 2020 23:32:52 +0200
Subject: [Buildroot] [git commit branch/next] package/mongoose: bump to to
 version 6.18
Message-ID: <20200529211535.D62C191EAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=517bae2087032f36b04639ccc8aec00638e1be1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

See https://github.com/cesanta/mongoose/releases/tag/6.18

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mongoose/mongoose.hash | 2 +-
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index c5de11bec2..b8be69be0b 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  5bff3cc70bb2248cf87d06a3543f120f3b29b9368d25a7715443cb10612987cc  mongoose-6.17.tar.gz
+sha256  f5c10346abc9c72f7cac7885d853ca064fb09aad57580433941a8fd7a3543769  mongoose-6.18.tar.gz
 sha256  fdc34eeea97327d75c83492abd34f1a3200c53dec04422ecda8071dc60a36d10  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 7944f5e534..87f56d7894 100644
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
