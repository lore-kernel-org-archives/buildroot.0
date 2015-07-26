From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2015 00:35:10 +0200
Subject: [Buildroot] [PATCH 1/3] package/xserver: switch to the modular
	server as default
In-Reply-To: <cover.1437950027.git.yann.morin.1998@free.fr>
References: <cover.1437950027.git.yann.morin.1998@free.fr>
Message-ID: <0676f015c8c6263ce5334c2f97be95151ab216c0.1437950027.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/x11r7/xserver_xorg-server/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index dc0b70c..f0ec598 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -87,7 +87,6 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
 
 choice
 	prompt "X Window System server type"
-	default BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
 	help
 	  Select the X Window System server to use
 
-- 
1.9.1
