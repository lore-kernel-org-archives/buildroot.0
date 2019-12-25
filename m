From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 22:34:00 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/qt-webkit-kiosk:
 add an upstream URL to Config.in
Message-ID: <20191225212549.428E58E451@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=71320bc30bf39164f1e2c5596134958e6a7e17b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a7edcb7a7c7240fa8e5e876f2a115d21cf700b8e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt-webkit-kiosk/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt-webkit-kiosk/Config.in b/package/qt-webkit-kiosk/Config.in
index 71f7daaa26..46688a227b 100644
--- a/package/qt-webkit-kiosk/Config.in
+++ b/package/qt-webkit-kiosk/Config.in
@@ -14,6 +14,8 @@ config BR2_PACKAGE_QT_WEBKIT_KIOSK
 	help
 	  Simple kiosk-mode browser powered by Qt5Webkit
 
+	  https://github.com/sergey-dryabzhinsky/qt-webkit-kiosk
+
 if BR2_PACKAGE_QT_WEBKIT_KIOSK
 
 config BR2_PACKAGE_QT_WEBKIT_KIOSK_SOUNDS
