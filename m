From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Apr 2014 10:35:38 +0200
Subject: [Buildroot] [git commit] postgresql: change readline and zlib to be
	real optional selections
Message-ID: <20140421083609.9ACFF9C90A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=85dc7d01c15b309869049405df13bdc28fd8a349
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/postgresql/Config.in |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
index 501e2f3..3ef5e6c 100644
--- a/package/postgresql/Config.in
+++ b/package/postgresql/Config.in
@@ -4,8 +4,6 @@ config BR2_PACKAGE_POSTGRESQL
 	# enabled, due to an uClibc bug, see
 	# http://lists.uclibc.org/pipermail/uclibc/2014-April/048326.html.
 	depends on BR2_TOOLCHAIN_USES_GLIBC
-	select BR2_PACKAGE_READLINE
-	select BR2_PACKAGE_ZLIB
 	help
 	  PostgreSQL is a powerful, open source object-relational
 	  database system.
