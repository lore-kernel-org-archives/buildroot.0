From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 10 Apr 2015 18:53:20 +0200
Subject: [Buildroot] [PATCH 1/2] package/qt5/qt5xmlpatterns: Fix license
Message-ID: <1428684801-24491-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/853/85335cddd123cae5a5b99d715c179c26ed9d6009/
http://autobuild.buildroot.net/results/097/0970e3d663da687f9bcdf0136584eaa5629f4216/
http://autobuild.buildroot.net/results/c62/c62eef5e5b8add138cdab34e64103d974d0a510b/
http://autobuild.buildroot.net/results/8b2/8b22985cc4a3ed3ced5900931dc6ec3b4c2f36c6/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index b69cac7..136da9f 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -11,8 +11,8 @@ QT5XMLPATTERNS_DEPENDENCIES = qt5base
 QT5XMLPATTERNS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5XMLPATTERNS_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
-QT5XMLPATTERNS_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2
+QT5XMLPATTERNS_LICENSE = LGPLv2.1 with exception or LGPLv3
+QT5XMLPATTERNS_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3
 else
 QT5XMLPATTERNS_LICENSE = Commercial license
 QT5XMLPATTERNS_REDISTRIBUTE = NO
-- 
1.7.10.4
