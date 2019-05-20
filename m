From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 May 2019 16:05:30 +0200
Subject: [Buildroot] [git commit] package/genimage: bump to version 11
Message-ID: <20190602201234.EDF5481354@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9ac298a027f3c71a3aaae12e63eba7df8ce7a14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add GPT support and new options for partitions and images creation.

Signed-off-by: Paulo Serra Filho <ptvsf@cesar.org.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/genimage/genimage.hash | 2 +-
 package/genimage/genimage.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/genimage/genimage.hash b/package/genimage/genimage.hash
index 095eb1413f..dedb32b2e1 100644
--- a/package/genimage/genimage.hash
+++ b/package/genimage/genimage.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	5a36b2c1387007c2d6535a722ee257a387d0913bddcf8a94d460e6acd4d01859	genimage-10.tar.xz
+sha256	2ee024bfb2ec157651b86f3365d138ee013dcc48277d86e1eed6f3285a67b532	genimage-11.tar.xz
diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index 393c3e9b94..5ef7d301fa 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENIMAGE_VERSION = 10
+GENIMAGE_VERSION = 11
 GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
 GENIMAGE_SITE = https://github.com/pengutronix/genimage/releases/download/v$(GENIMAGE_VERSION)
 HOST_GENIMAGE_DEPENDENCIES = host-pkgconf host-libconfuse
