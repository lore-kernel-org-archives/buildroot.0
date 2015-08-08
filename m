From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:58:11 -0000
Subject: [Buildroot] [git commit branch/next] qt5: remove GPLv2 license from
	qt5declarative, qt5script and qt5svg
Message-ID: <20150808105640.365797F8D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bdd522f9213788d404540f5c016bdd431d9be04a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since Qt 5.5, those three modules have lost their GPLv2 licensing
option. Remains the LGPLv2.1 with exception and LGPLv3 as the possible
open-source licenses.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5declarative/qt5declarative.mk |    4 ++--
 package/qt5/qt5script/qt5script.mk           |    4 ++--
 package/qt5/qt5svg/qt5svg.mk                 |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index 30c0813..296292b 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -11,8 +11,8 @@ QT5DECLARATIVE_DEPENDENCIES = qt5base qt5xmlpatterns
 QT5DECLARATIVE_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5DECLARATIVE_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
-QT5DECLARATIVE_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2
+QT5DECLARATIVE_LICENSE = LGPLv2.1 with exception or LGPLv3
+QT5DECLARATIVE_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3
 else
 QT5DECLARATIVE_LICENSE = Commercial license
 QT5DECLARATIVE_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
index 7f0efbb..250bdfd 100644
--- a/package/qt5/qt5script/qt5script.mk
+++ b/package/qt5/qt5script/qt5script.mk
@@ -11,8 +11,8 @@ QT5SCRIPT_DEPENDENCIES = qt5base
 QT5SCRIPT_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5SCRIPT_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
-QT5SCRIPT_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2
+QT5SCRIPT_LICENSE = LGPLv2.1 with exception or LGPLv3
+QT5SCRIPT_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3
 else
 QT5SCRIPT_LICENSE = Commercial license
 QT5SCRIPT_REDISTRIBUTE = NO
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index 8aaa517..5942d01 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -11,8 +11,8 @@ QT5SVG_DEPENDENCIES = qt5base
 QT5SVG_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5SVG_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
-QT5SVG_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2
+QT5SVG_LICENSE = LGPLv2.1 with exception or LGPLv3
+QT5SVG_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3
 else
 QT5SVG_LICENSE = Commercial license
 QT5SVG_REDISTRIBUTE = NO
