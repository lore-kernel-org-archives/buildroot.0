From: Carlos Santos <casantos@datacom.com.br>
Date: Thu,  5 Jul 2018 23:22:39 -0300
Subject: [Buildroot] [PATCH] liblogging: update project URL
Message-ID: <20180706022239.12854-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The original site www.liblogging.org has been taken down because of the
new European data protection regulation (GDPR), to which it was not
compliant.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/liblogging/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/liblogging/Config.in b/package/liblogging/Config.in
index 23c3c1ad2d..a39fdf8ddc 100644
--- a/package/liblogging/Config.in
+++ b/package/liblogging/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_LIBLOGGING
 	  logging. It offers an enhanced replacement
 	  for the syslog() call, but retains its ease of use.
 
-	  http://www.liblogging.org/
+	  https://www.rsyslog.com/liblogging/
-- 
2.17.1
