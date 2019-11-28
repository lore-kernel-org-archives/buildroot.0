From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 28 Nov 2019 16:00:58 +0000
Subject: [Buildroot] [PATCH 7/7] package/matchbox-startup-monitor: add an
 upstream URL to Config.in
In-Reply-To: <20191128160058.24118-1-mark@dibsco.co.uk>
References: <20191128160058.24118-1-mark@dibsco.co.uk>
Message-ID: <20191128160058.24118-7-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
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
-- 
2.20.1
