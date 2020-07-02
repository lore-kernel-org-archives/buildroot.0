From: Francois Perrad <fperrad@gmail.com>
Date: Thu,  2 Jul 2020 22:22:28 +0200
Subject: [Buildroot] [PATCH 09/11] package/lua-flu: temporarily disabled
 with Lua 5.4
In-Reply-To: <20200702202230.1531929-1-francois.perrad@gadz.org>
References: <20200702202230.1531929-1-francois.perrad@gadz.org>
Message-ID: <20200702202230.1531929-10-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-flu/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lua-flu/Config.in b/package/lua-flu/Config.in
index 526dc9008..434271eed 100644
--- a/package/lua-flu/Config.in
+++ b/package/lua-flu/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LUA_FLU
 	depends on !BR2_STATIC_LIBS # libfuse
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
 	depends on BR2_USE_MMU # libfuse
+	depends on !BR2_PACKAGE_LUA_5_4
 	select BR2_PACKAGE_ATTR
 	select BR2_PACKAGE_LIBFUSE
 	help
-- 
2.25.1
