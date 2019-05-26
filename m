From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 09:24:52 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/collectd: replace
 utf-8 quote by ascii single quote
Message-ID: <20190526072357.B4FBC8E152@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f45e9eab5767a0e0208fa92971cc797937d536d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ca5c5fe44c59d131f0c67afcc85979e2615d8373)
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
