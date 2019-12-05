From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Dec 2019 22:43:54 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/luasql-sqlite3:
 update the upstream URL in Config.in
Message-ID: <20191205213858.F15278015F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49a3ab76a160992f9cb5ac52e0aaca715c50ce97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(406)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b27c5c1c0b0094cd0e5282e9588fa5ddb9632a96)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
