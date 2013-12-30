From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Dec 2013 00:09:35 +0100
Subject: [Buildroot] [git commit] qt5script: depend on
	BR2_PACKAGE_QT5_JSCORE_AVAILABLE
Message-ID: <20131230230946.658BF9C2A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=08fc7be2bbf6e6e2260db0f47690842b177084ff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5script/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
