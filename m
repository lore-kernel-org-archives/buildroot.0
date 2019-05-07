From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 May 2019 22:58:23 +0200
Subject: [Buildroot] [git commit] package/collectd: replace utf-8 quote by
 ascii single quote
Message-ID: <20190507210158.086C1815D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca5c5fe44c59d131f0c67afcc85979e2615d8373
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 3222547b68..0cf04b5180 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -389,7 +389,7 @@ config BR2_PACKAGE_COLLECTD_POSTGRESQL
 	  Connects to and executes SQL statements on a PostgreSQL
 	  database. It then reads back the results and, depending on the
 	  configuration, the returned values are then converted into
-	  collectd ???value lists???.
+	  collectd 'value lists'.
 
 comment "postgresql support needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
