From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump resourceproto to 1.1.0
Message-ID: <20100308133701.0B144776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2f6e10c9bc9427456cd4fd2ec4109ca91f037a44
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xproto_resourceproto/Config.in       |    2 +-
 .../xproto_resourceproto/xproto_resourceproto.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xproto_resourceproto/Config.in b/package/x11r7/xproto_resourceproto/Config.in
index b9297f7..0eebfc7 100644
--- a/package/x11r7/xproto_resourceproto/Config.in
+++ b/package/x11r7/xproto_resourceproto/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XPROTO_RESOURCEPROTO
 	bool "resourceproto"
 	help
-	  resourceproto 1.0.2
+	  resourceproto 1.1.0
 	  X.Org Resource protocol headers
diff --git a/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk b/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
index 74d7d91..c5e0d47 100644
--- a/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
+++ b/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_RESOURCEPROTO_VERSION = 1.0.2
+XPROTO_RESOURCEPROTO_VERSION = 1.1.0
 XPROTO_RESOURCEPROTO_SOURCE = resourceproto-$(XPROTO_RESOURCEPROTO_VERSION).tar.bz2
 XPROTO_RESOURCEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_RESOURCEPROTO_AUTORECONF = NO
-- 
1.6.3.3
