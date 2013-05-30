From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 30 May 2013 22:03:00 +0200
Subject: [Buildroot] [git commit] qt5: add libQt5OpenGL.so library
	installation
Message-ID: <20130602212115.0EBC19A6D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=db3efd92adfc1c86811d8d664e8e979a82c49944
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When qt5 is built with EGLFS support, libQt5OpenGL library should be copied to
target.

Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt5/qt5base/qt5base.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index bfc6c91..7c6a093 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -118,6 +118,7 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_CONCURRENT) += Qt5Concurrent
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_SQL)        += Qt5Sql
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_TEST)       += Qt5Test
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XML)        += Qt5Xml
+QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5OpenGL
 
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_GUI)          += Qt5Gui
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_WIDGETS)      += Qt5Widgets
