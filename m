From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Mon, 25 Nov 2019 13:18:20 +0100
Subject: [Buildroot] [PATCH] package/python-crontab: fix check-package
 warning
Message-ID: <1574684300-30391-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

package/python-crontab/Config.in:5: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
26 lines processed
1 warnings generated

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/python-crontab/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/python-crontab/Config.in b/package/python-crontab/Config.in
index f97e00a..102dbbd 100644
--- a/package/python-crontab/Config.in
+++ b/package/python-crontab/Config.in
@@ -2,7 +2,8 @@ config BR2_PACKAGE_PYTHON_CRONTAB
 	bool "python-crontab"
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
 	help
-	  Crontab module for reading and writing crontab files and accessing
-	  the system cron automatically and simply using a direct API.
+	  Crontab module for reading and writing crontab files and
+	  accessing the system cron automatically and simply using
+	  a direct API.
 
 	  https://gitlab.com/doctormo/python-crontab/
-- 
2.7.4
