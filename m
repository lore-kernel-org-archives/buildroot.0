From: Mark Corbin <mark@dibsco.co.uk>
Date: Wed, 18 Dec 2019 13:03:44 +0000
Subject: [Buildroot] [PATCH 1/1] package/syslog-ng: update the upstream URL
 in Config.in
Message-ID: <20191218130344.9244-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(Err)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/syslog-ng/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/syslog-ng/Config.in b/package/syslog-ng/Config.in
index a537115616..30ad54a4bf 100644
--- a/package/syslog-ng/Config.in
+++ b/package/syslog-ng/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_SYSLOG_NG
 	  of input and output methods: syslog, unstructured text,
 	  queueing, SQL & NoSQL
 
-	  https://syslog-ng.org/
+	  https://www.syslog-ng.com/products/open-source-log-management/
 
 comment "syslog-ng needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-- 
2.20.1
