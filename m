From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Jan 2018 22:29:03 +0100
Subject: [Buildroot] [git commit] package/sdl2: Remove trailing backslash
Message-ID: <20180122213643.13C0083E9A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2c6eaade1f3e120baca53b5e09f1a2b4fc13557
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Left over from 9f8a6fdf9

Signed-off-by: Guillermo A. Amaral <g@maral.me>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl2/sdl2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 113e106..6cb24d9 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -18,7 +18,7 @@ SDL2_CONF_OPTS += \
 	--disable-esd \
 	--disable-dbus \
 	--disable-pulseaudio \
-	--disable-video-wayland \
+	--disable-video-wayland
 
 # We must enable static build to get compilation successful.
 SDL2_CONF_OPTS += --enable-static
