From: Guillermo A. Amaral <g@maral.me>
Date: Sat, 20 Jan 2018 13:25:47 -0800
Subject: [Buildroot] [PATCH 1/1] package/sdl2: Remove trailing backslash
In-Reply-To: <87r2qlcys8.fsf@dell.be.48ers.dk>
References: <87r2qlcys8.fsf@dell.be.48ers.dk>
Message-ID: <20180120212547.6410-1-g@maral.me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Left over from 9f8a6fdf9

Signed-off-by: Guillermo A. Amaral <g@maral.me>
---
 package/sdl2/sdl2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 113e1063d..6cb24d9e7 100644
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
-- 
2.13.6
