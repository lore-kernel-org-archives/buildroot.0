From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 17:00:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/lua: add LUA_CPE_ID_VENDOR
Message-ID: <20210117160010.350877-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:lua:lua is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alua%3Alua

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lua/lua.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 387df61692..e3a415a06a 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -19,6 +19,7 @@ LUA_LICENSE_FILES = doc/readme.html
 else
 LUA_LICENSE_FILES = COPYRIGHT
 endif
+LUA_CPE_ID_VENDOR = lua
 
 LUA_PROVIDES = luainterpreter
 
-- 
2.29.2
