From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  7 May 2019 22:35:31 +0200
Subject: [Buildroot] [PATCH v1 11/28] package/collectd: replace utf-8 quote
 by ascii single quote
In-Reply-To: <20190507203548.10337-1-ps.report@gmx.net>
References: <20190507203548.10337-1-ps.report@gmx.net>
Message-ID: <20190507203548.10337-11-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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
-	  collectd ?value lists?.
+	  collectd 'value lists'.

 comment "postgresql support needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
--
2.21.0
