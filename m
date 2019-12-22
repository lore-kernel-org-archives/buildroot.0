From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 14:07:45 +0100
Subject: [Buildroot] [git commit] package/qt-webkit-kiosk: add an upstream
 URL to Config.in
Message-ID: <20191222125843.0FB1B88E73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7edcb7a7c7240fa8e5e876f2a115d21cf700b8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
