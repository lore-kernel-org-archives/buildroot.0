From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Dec 2019 22:45:37 +0100
Subject: [Buildroot] [git commit branch/2019.02.x]
 package/matchbox-startup-monitor: add an upstream URL to Config.in
Message-ID: <20191205213859.59C2E818E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f4606ef89a3c2e2a02baf072dcbf2e8be591edb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 56fff9ef97fe231e2f118a1365ff000f9d77365e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/matchbox-startup-monitor/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/matchbox-startup-monitor/Config.in b/package/matchbox-startup-monitor/Config.in
index 9dce60ea12..be2fab4c1a 100644
--- a/package/matchbox-startup-monitor/Config.in
+++ b/package/matchbox-startup-monitor/Config.in
@@ -4,3 +4,5 @@ config BR2_PACKAGE_MATCHBOX_STARTUP_MONITOR
 	select BR2_PACKAGE_STARTUP_NOTIFICATION
 	help
 	  Matchbox Panel Startup Monitor Applet.
+
+	  http://git.yoctoproject.org/cgit.cgi/mb-applet-startup-monitor/
