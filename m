From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump smproxy to 1.0.3
Message-ID: <20100308133643.720A47774C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=630f9d9fd7b76c3e774da165bf16605eef6113b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_smproxy/Config.in       |    2 +-
 package/x11r7/xapp_smproxy/xapp_smproxy.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_smproxy/Config.in b/package/x11r7/xapp_smproxy/Config.in
index f28b00e..dc72350 100644
--- a/package/x11r7/xapp_smproxy/Config.in
+++ b/package/x11r7/xapp_smproxy/Config.in
@@ -3,5 +3,5 @@ config BR2_PACKAGE_XAPP_SMPROXY
 	select BR2_PACKAGE_XLIB_LIBXMU
 	select BR2_PACKAGE_XLIB_LIBXT
 	help
-	  smproxy 1.0.2
+	  smproxy 1.0.3
 	  Session Manager Proxy
diff --git a/package/x11r7/xapp_smproxy/xapp_smproxy.mk b/package/x11r7/xapp_smproxy/xapp_smproxy.mk
index 8128e03..fa2acb3 100644
--- a/package/x11r7/xapp_smproxy/xapp_smproxy.mk
+++ b/package/x11r7/xapp_smproxy/xapp_smproxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_SMPROXY_VERSION = 1.0.2
+XAPP_SMPROXY_VERSION = 1.0.3
 XAPP_SMPROXY_SOURCE = smproxy-$(XAPP_SMPROXY_VERSION).tar.bz2
 XAPP_SMPROXY_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_SMPROXY_AUTORECONF = NO
-- 
1.6.3.3
