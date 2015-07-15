From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:06 -0300
Subject: [Buildroot] [PATCH 15/40] sdl_gfx: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-15-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also update homepage URL.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sdl_gfx/Config.in    | 2 +-
 package/sdl_gfx/sdl_gfx.hash | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 package/sdl_gfx/sdl_gfx.hash

diff --git a/package/sdl_gfx/Config.in b/package/sdl_gfx/Config.in
index 4910b2d..b5d5cac 100644
--- a/package/sdl_gfx/Config.in
+++ b/package/sdl_gfx/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_SDL_GFX
 	  circles or polygons, an interpolating rotozoomer for SDL
 	  surfaces, framerate control and MMX image filters.
 
-	  http://www.ferzkopp.net/joomla/content/view/19/14/
+	  http://cms.ferzkopp.net/index.php/software/13-sdl-gfx
diff --git a/package/sdl_gfx/sdl_gfx.hash b/package/sdl_gfx/sdl_gfx.hash
new file mode 100644
index 0000000..8c2be96
--- /dev/null
+++ b/package/sdl_gfx/sdl_gfx.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/sdlgfx/files/
+md5	fcc3c4f2d1b4943409bf7e67dd65d03a	SDL_gfx-2.0.23.tar.gz
+sha1	aae60e7fed539f3f8a0a0bd6da3bbcf625642596	SDL_gfx-2.0.23.tar.gz
-- 
2.3.6
