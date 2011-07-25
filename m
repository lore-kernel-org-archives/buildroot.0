From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Jul 2011 08:44:26 +0200
Subject: [Buildroot] [git commit] xorg-xserver: configure needs pkg-config
Message-ID: <20110725064529.C5F578B4A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b96193a4b53e0c6661c722aa4e91e7cfb7608cef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 0311483..70ba8b2 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -54,7 +54,8 @@ XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	xkeyboard-config		\
 	pixman 				\
 	openssl 			\
-	mcookie
+	mcookie 			\
+	host-pkg-config
 
 XSERVER_XORG_SERVER_CONF_OPT = --disable-config-hal \
 		--disable-xnest --disable-xephyr --disable-xvfb \
-- 
1.7.3.4
