From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 17:02:29 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/metacity: add an
 upstream URL to Config.in
Message-ID: <20191203160316.4E6B3864BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=007fb200ad5bffd903b5635b5cfb7784e69139d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d6026cb1013347d1bf68245f9f9387fb2faec91e)
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
