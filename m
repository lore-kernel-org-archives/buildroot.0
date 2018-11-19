From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Nov 2018 22:01:35 +0100
Subject: [Buildroot] [git commit] package/webkitgtk: use proper USE_WOFF2
 flag instead of ENABLE_WOFF2
Message-ID: <20181119205851.6B58183AEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef3deade617769e6e2f509985cddf0958cda4a02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/webkitgtk/webkitgtk.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 54a791cd14..16644f0e93 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -22,10 +22,10 @@ WEBKITGTK_CONF_OPTS = \
 	-DENABLE_INTROSPECTION=OFF \
 	-DENABLE_MINIBROWSER=ON \
 	-DENABLE_SPELLCHECK=ON \
-	-DENABLE_WOFF2=ON \
 	-DPORT=GTK \
 	-DUSE_LIBNOTIFY=OFF \
-	-DUSE_LIBHYPHEN=OFF
+	-DUSE_LIBHYPHEN=OFF \
+	-DUSE_WOFF2=ON
 
 ifeq ($(BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_JIT=ON
