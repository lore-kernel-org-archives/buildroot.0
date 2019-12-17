From: Mark Corbin <mark@dibsco.co.uk>
Date: Tue, 17 Dec 2019 13:57:37 +0000
Subject: [Buildroot] [PATCH 1/1] package/qt-webkit-kiosk: add an upstream
 URL to Config.in
Message-ID: <20191217135737.25806-1-mark@dibsco.co.uk>
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
-- 
2.20.1
