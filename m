From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  6 Feb 2013 17:24:11 +0100
Subject: [Buildroot] [PATCH 3/5] qt: define license
In-Reply-To: <1360167853-7177-1-git-send-email-luca@lucaceresoli.net>
References: <1360167853-7177-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1360167853-7177-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/qt/qt.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index ee1a88b..06237ef 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -16,6 +16,8 @@ QT_SOURCE  = qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
 QT_SITE    = http://releases.qt-project.org/qt4/source
 QT_DEPENDENCIES = host-pkgconf
 QT_INSTALL_STAGING = YES
+QT_LICENSE = LGPLv2.1 with exceptions or GPLv3 or commercial
+QT_LICENSE_FILES = LICENSE.LGPL LGPL_EXCEPTION.txt LICENSE.GPL3
 
 ifeq ($(BR2_PACKAGE_QT_LICENSE_APPROVED),y)
 QT_CONFIGURE_OPTS += -opensource -confirm-license
-- 
1.7.10.4
