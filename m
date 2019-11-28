From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 28 Nov 2019 16:23:56 +0000
Subject: [Buildroot] [PATCH 1/1] package/metacity: add an upstream URL to
 Config.in
Message-ID: <20191128162356.27077-1-mark@dibsco.co.uk>
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
 package/metacity/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/metacity/Config.in b/package/metacity/Config.in
index 833a091e7f..fc106a26b9 100644
--- a/package/metacity/Config.in
+++ b/package/metacity/Config.in
@@ -14,3 +14,5 @@ config BR2_PACKAGE_METACITY
 	select BR2_PACKAGE_XLIB_LIBXFT
 	help
 	  Metacity is a window manager for the X Window System.
+
+	  https://wiki.gnome.org/Projects/Metacity
-- 
2.20.1
