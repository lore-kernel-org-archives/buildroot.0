From: Paulo Serra Filho <ptvsf@cesar.org.br>
Date: Sun, 19 May 2019 17:05:05 -0300
Subject: [Buildroot] [PATCH 1/1] package/genimage: bump to version 11
Message-ID: <1558296305-18316-1-git-send-email-ptvsf@cesar.org.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add GPT support and new options for partitions and images creation.

Signed-off-by: Paulo Serra Filho <ptvsf@cesar.org.br>
---
 package/genimage/genimage.hash | 2 +-
 package/genimage/genimage.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/genimage/genimage.hash b/package/genimage/genimage.hash
index 095eb14..dedb32b 100644
--- a/package/genimage/genimage.hash
+++ b/package/genimage/genimage.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	5a36b2c1387007c2d6535a722ee257a387d0913bddcf8a94d460e6acd4d01859	genimage-10.tar.xz
+sha256	2ee024bfb2ec157651b86f3365d138ee013dcc48277d86e1eed6f3285a67b532	genimage-11.tar.xz
diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index 393c3e9..5ef7d30 100644
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
-- 
2.7.4
