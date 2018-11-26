From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 17:17:19 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/webkitgtk: use
 proper USE_WOFF2 flag instead of ENABLE_WOFF2
Message-ID: <20181126161408.1F309886F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8771409fa87d3bc76b7ef081e3f5b598810d30f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ef3deade617769e6e2f509985cddf0958cda4a02)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 603827ba09..8fed156a20 100644
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
 
 # ARM needs NEON for JIT
 # i386 & x86_64 don't seem to have any special requirements
