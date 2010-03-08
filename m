From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump recordproto to 1.14
Message-ID: <20100308133620.D7CDB776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c3e219e3a8843f61b2d48b5289a2a63e22c92b2d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xproto_recordproto/Config.in         |    2 +-
 .../x11r7/xproto_recordproto/xproto_recordproto.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xproto_recordproto/Config.in b/package/x11r7/xproto_recordproto/Config.in
index aeabd09..2ccddb8 100644
--- a/package/x11r7/xproto_recordproto/Config.in
+++ b/package/x11r7/xproto_recordproto/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XPROTO_RECORDPROTO
 	bool "recordproto"
 	help
-	  recordproto 1.13.2
+	  recordproto 1.14
 	  X.Org Record protocol headers
diff --git a/package/x11r7/xproto_recordproto/xproto_recordproto.mk b/package/x11r7/xproto_recordproto/xproto_recordproto.mk
index 9c9e1ba..83178bd 100644
--- a/package/x11r7/xproto_recordproto/xproto_recordproto.mk
+++ b/package/x11r7/xproto_recordproto/xproto_recordproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_RECORDPROTO_VERSION = 1.13.2
+XPROTO_RECORDPROTO_VERSION = 1.14
 XPROTO_RECORDPROTO_SOURCE = recordproto-$(XPROTO_RECORDPROTO_VERSION).tar.bz2
 XPROTO_RECORDPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_RECORDPROTO_AUTORECONF = NO
-- 
1.6.3.3
