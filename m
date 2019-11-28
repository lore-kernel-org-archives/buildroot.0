From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 28 Nov 2019 12:38:31 +0000
Subject: [Buildroot] [PATCH 1/1] package/libiscsi: update the upstream URL
 in Config.in
Message-ID: <20191128123831.1134-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the upstream URL in the help text in Config.in. Removing
the trailing comment from the URL line addresses the 'Missing'
status in the package stats web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/libiscsi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libiscsi/Config.in b/package/libiscsi/Config.in
index 1e75071476..932f857858 100644
--- a/package/libiscsi/Config.in
+++ b/package/libiscsi/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_LIBISCSI
 	  scsi tasks, but a sync layer is also provided for ease of use
 	  for simpler applications.
 
-	  https://github.com/sahlberg/libiscsi  (no proper homepage)
+	  https://github.com/sahlberg/libiscsi
 
 comment "libiscsi needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.20.1
