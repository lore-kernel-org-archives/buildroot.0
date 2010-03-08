From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump inputproto to 2.0
Message-ID: <20100308133616.2EAF9776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9f07a96d8fd024ebfb67d4393c8ef351d4a295b9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xproto_inputproto/Config.in          |    2 +-
 .../x11r7/xproto_inputproto/xproto_inputproto.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xproto_inputproto/Config.in b/package/x11r7/xproto_inputproto/Config.in
index 9be91cf..46d1029 100644
--- a/package/x11r7/xproto_inputproto/Config.in
+++ b/package/x11r7/xproto_inputproto/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XPROTO_INPUTPROTO
 	bool "inputproto"
 	help
-	  inputproto 1.3.2
+	  inputproto 2.0
 	  X.Org Input protocol headers
diff --git a/package/x11r7/xproto_inputproto/xproto_inputproto.mk b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
index cd2b8c2..d83ba7e 100644
--- a/package/x11r7/xproto_inputproto/xproto_inputproto.mk
+++ b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_INPUTPROTO_VERSION = 1.4.4
+XPROTO_INPUTPROTO_VERSION = 2.0
 XPROTO_INPUTPROTO_SOURCE = inputproto-$(XPROTO_INPUTPROTO_VERSION).tar.bz2
 XPROTO_INPUTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_INPUTPROTO_AUTORECONF = NO
-- 
1.6.3.3
