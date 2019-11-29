From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 09:47:29 +0100
Subject: [Buildroot] [git commit] package/metacity: add an upstream URL to
 Config.in
Message-ID: <20191129090525.62D658219D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6026cb1013347d1bf68245f9f9387fb2faec91e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
