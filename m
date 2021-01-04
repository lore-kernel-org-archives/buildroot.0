From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Jan 2021 21:29:43 +0100
Subject: [Buildroot] [git commit] package/mongoose: bump to to version 7.0
Message-ID: <20210104201256.CFB3286108@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91efa2e99f8be63f4217a94afa40ea7ac0e8eeee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update LICENSE hash; copyright year update:

-Copyright (c) 2004-2013 Sergey Lyubka <valenok@gmail.com>
-Copyright (c) 2013-2018 Cesanta Software Limited
+Copyright (c) 2004-2013 Sergey Lyubka
+Copyright (c) 2013-2020 Cesanta Software Limited

See https://github.com/cesanta/mongoose/releases/tag/7.0

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mongoose/mongoose.hash | 4 ++--
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index b8be69be0b..149c0f5866 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  f5c10346abc9c72f7cac7885d853ca064fb09aad57580433941a8fd7a3543769  mongoose-6.18.tar.gz
-sha256  fdc34eeea97327d75c83492abd34f1a3200c53dec04422ecda8071dc60a36d10  LICENSE
+sha256  28206185873b5c448765f56e54d86a7af5a856b0b5f241aa44ac94bf34af7eee  mongoose-7.0.tar.gz
+sha256  9553d057f2ba980642f2c18d87ed38896cff1c9612d77d684a73a11fe1443b05  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 5faeafb374..ae20965be4 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 6.18
+MONGOOSE_VERSION = 7.0
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
