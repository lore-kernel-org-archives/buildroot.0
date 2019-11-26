From: Mark Corbin <mark@dibsco.co.uk>
Date: Tue, 26 Nov 2019 18:54:19 +0000
Subject: [Buildroot] [PATCH 1/1] package/gtkperf: add an upstream URL to
 Config.in
Message-ID: <20191126185419.7673-1-mark@dibsco.co.uk>
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
 package/gtkperf/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gtkperf/Config.in b/package/gtkperf/Config.in
index 78c35e72e7..a763e305c7 100644
--- a/package/gtkperf/Config.in
+++ b/package/gtkperf/Config.in
@@ -7,3 +7,5 @@ config BR2_PACKAGE_GTKPERF
 	  predefined GTK+ widgets
 	  e.g. (opening comboboxes, toggling buttons, scrolling text
 	  yms.) and this way define the speed of device/platform.
+
+	  http://gtkperf.sourceforge.net/
-- 
2.20.1
