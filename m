From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 22:10:01 +0100
Subject: [Buildroot] [git commit] package/gtkperf: add an upstream URL to
 Config.in
Message-ID: <20191126210245.4057A8152E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b35a66253cfa452e32cf22c2b4aa9b859956d90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
