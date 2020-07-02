From: Francois Perrad <fperrad@gmail.com>
Date: Thu,  2 Jul 2020 22:22:29 +0200
Subject: [Buildroot] [PATCH 10/11] package/lua-sdl2: temporarily disabled
 with Lua 5.4
In-Reply-To: <20200702202230.1531929-1-francois.perrad@gadz.org>
References: <20200702202230.1531929-1-francois.perrad@gadz.org>
Message-ID: <20200702202230.1531929-11-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-sdl2/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lua-sdl2/Config.in b/package/lua-sdl2/Config.in
index 65f9e7ff4..faf1fa853 100644
--- a/package/lua-sdl2/Config.in
+++ b/package/lua-sdl2/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LUA_SDL2
 	bool "lua-sdl2"
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_PACKAGE_LUA_5_4
 	select BR2_PACKAGE_SDL2
 	help
 	  Lua-SDL2 is a pure C binding of SDL2 to Lua 5.1, Lua 5.2,
-- 
2.25.1
