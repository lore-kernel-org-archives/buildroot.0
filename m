From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Tue, 13 May 2014 09:52:46 +0300
Subject: [Buildroot] [PATCH] qt5quick1: add missing dependency on network
	module
Message-ID: <1399963966-22118-1-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
 package/qt5/qt5quick1/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5quick1/Config.in b/package/qt5/qt5quick1/Config.in
index 59b6c34..32656be 100644
--- a/package/qt5/qt5quick1/Config.in
+++ b/package/qt5/qt5quick1/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_QT5QUICK1
 	bool "qt5quick1"
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_GUI
+	select BR2_PACKAGE_QT5BASE_NETWORK
 	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5SCRIPT
 	select BR2_PACKAGE_QT5XMLPATTERNS
-- 
1.9.1
