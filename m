From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump videoproto to 2.3.0
Message-ID: <20100308133701.43C4F776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cfe33eedbc7aa1ca1f82a770f1565ba8fc4761c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xproto_videoproto/Config.in          |    2 +-
 .../x11r7/xproto_videoproto/xproto_videoproto.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xproto_videoproto/Config.in b/package/x11r7/xproto_videoproto/Config.in
index 13d9a5a..589dcec 100644
--- a/package/x11r7/xproto_videoproto/Config.in
+++ b/package/x11r7/xproto_videoproto/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XPROTO_VIDEOPROTO
 	bool "videoproto"
 	help
-	  videoproto 2.2.2
+	  videoproto 2.3.0
 	  X.Org Video protocol headers
diff --git a/package/x11r7/xproto_videoproto/xproto_videoproto.mk b/package/x11r7/xproto_videoproto/xproto_videoproto.mk
index 81c00d5..3b98370 100644
--- a/package/x11r7/xproto_videoproto/xproto_videoproto.mk
+++ b/package/x11r7/xproto_videoproto/xproto_videoproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_VIDEOPROTO_VERSION = 2.2.2
+XPROTO_VIDEOPROTO_VERSION = 2.3.0
 XPROTO_VIDEOPROTO_SOURCE = videoproto-$(XPROTO_VIDEOPROTO_VERSION).tar.bz2
 XPROTO_VIDEOPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_VIDEOPROTO_AUTORECONF = NO
-- 
1.6.3.3
