From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 10 Apr 2015 18:53:21 +0200
Subject: [Buildroot] [PATCH 2/2] package/qt5/qt5multimedia: Fix license
In-Reply-To: <1428684801-24491-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428684801-24491-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1428684801-24491-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/533/533c1d8529e2006379fb8eacb5ea1c23f240f724/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/qt5/qt5multimedia/qt5multimedia.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 0c8d2ec..763fc28 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -11,8 +11,8 @@ QT5MULTIMEDIA_DEPENDENCIES = qt5base
 QT5MULTIMEDIA_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5MULTIMEDIA_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
-QT5MULTIMEDIA_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2
+QT5MULTIMEDIA_LICENSE = LGPLv2.1 with exception or LGPLv3
+QT5MULTIMEDIA_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3
 else
 QT5MULTIMEDIA_LICENSE = Commercial license
 QT5MULTIMEDIA_REDISTRIBUTE = NO
-- 
1.7.10.4
