From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Dec 2019 10:00:37 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/postgresql: fix
 minor typo
Message-ID: <20191206085334.B100482125@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b78768a13f0947f176cc3d702516f54b1086531e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

pgsql as a tool does not exist, it's called psql

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit d79bab065e13f5c6def3ce1884d684fdf9f9300c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
index e548d3cb27..2f677daf5b 100644
--- a/package/postgresql/Config.in
+++ b/package/postgresql/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_POSTGRESQL
 	  database system.
 
 	  Enable the readline package to gain readline support in
-	  pgsql (the command line interpreter), which offers
+	  psql (the command line interpreter), which offers
 	  command history and edit functions.
 
 	  Enable the zlib package to gain builtin compression for
