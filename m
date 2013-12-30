From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Mon, 30 Dec 2013 11:34:16 +0200
Subject: [Buildroot] [PATCH 2/3] qt5script: depend on
	BR2_PACKAGE_QT5_JSCORE_AVAILABLE
In-Reply-To: <1388396057-19042-1-git-send-email-fatih.asici@gmail.com>
References: <1388396057-19042-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <1388396057-19042-2-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
 package/qt5/qt5script/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5script/Config.in b/package/qt5/qt5script/Config.in
index 3c5d60c..f755d1e 100644
--- a/package/qt5/qt5script/Config.in
+++ b/package/qt5/qt5script/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_QT5SCRIPT
 	bool "qt5script"
 	select BR2_PACKAGE_QT5BASE
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
-- 
1.8.5.1
