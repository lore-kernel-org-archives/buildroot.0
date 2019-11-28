From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 28 Nov 2019 14:33:12 +0000
Subject: [Buildroot] [PATCH 1/1] package/luasql-sqlite3: update the upstream
 URL in Config.in
Message-ID: <20191128143312.10994-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(406)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/luasql-sqlite3/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luasql-sqlite3/Config.in b/package/luasql-sqlite3/Config.in
index cc4d3d5450..3a1fc6ba60 100644
--- a/package/luasql-sqlite3/Config.in
+++ b/package/luasql-sqlite3/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LUASQL_SQLITE3
 	help
 	  LuaSQL is a simple interface from Lua to a DBMS.
 
-	  http://www.keplerproject.org/luasql
+	  http://keplerproject.github.io/luasql/
-- 
2.20.1
