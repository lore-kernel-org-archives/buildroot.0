From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Apr 2019 23:26:19 +0200
Subject: [Buildroot] [git commit branch/2019.02.x]
 package/xserver_xorg-server: disable unit tests
Message-ID: <20190414212510.1E8788A509@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2004e75d35aa84b158989f0fb18fb7b6c14e561e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.org/results/95a5004c9245f1f90758631b02e17d3df12812ec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c41d8ba066125d4ae20f865e01c8143a5ff58a16)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 14f8104767..a33cb25076 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -47,6 +47,7 @@ XSERVER_XORG_SERVER_CONF_OPTS = \
 	--disable-xnest \
 	--disable-xephyr \
 	--disable-dmx \
+	--disable-unit-tests \
 	--with-builder-addr=buildroot at buildroot.org \
 	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/pixman-1 -O2" \
 	--with-fontrootdir=/usr/share/fonts/X11/ \
