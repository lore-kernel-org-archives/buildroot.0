From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Nov 2019 15:11:39 +0100
Subject: [Buildroot] [git commit] package/python-crontab: fix check-package
 warning
Message-ID: <20191202083935.1F7647FEF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a9523cd998284aa8496a053250006993ff55c2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

package/python-crontab/Config.in:5: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
26 lines processed
1 warnings generated

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-crontab/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/python-crontab/Config.in b/package/python-crontab/Config.in
index f97e00af5e..102dbbdb6b 100644
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
