From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 21 Apr 2014 01:25:12 +0200
Subject: [Buildroot] [PATCH 1/2] postgresql: change readline and zlib to be
	real optional selections
In-Reply-To: <1398036313-26556-1-git-send-email-ps.report@gmx.net>
References: <1398036313-26556-1-git-send-email-ps.report@gmx.net>
Message-ID: <1398036313-26556-2-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/postgresql/Config.in | 2 --
 1 file changed, 2 deletions(-)

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
-- 
1.8.1.4
