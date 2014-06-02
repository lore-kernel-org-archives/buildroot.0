From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Jun 2014 13:25:33 +0200
Subject: [Buildroot] [git commit] qt5websockets: correct license info
Message-ID: <20140602112623.6DA009CE7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0fbda5b69e488b5655a65b63a849e77574e84ba7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/c1d/c1de3b819af574712ec69a99d0db355c6c0ba735/

As stated by README.md:
This code is licensed under LGPL v2.1.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5websockets/qt5websockets.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index cac9931..5bfa1ed 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -11,8 +11,8 @@ QT5WEBSOCKETS_DEPENDENCIES = qt5base
 QT5WEBSOCKETS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5WEBSOCKETS_LICENSE = LGPLv2.1 or GPLv3.0
-QT5WEBSOCKETS_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
+QT5WEBSOCKETS_LICENSE = LGPLv2.1
+QT5WEBSOCKETS_LICENSE_FILES = LICENSE
 else
 QT5WEBSOCKETS_LICENSE = Commercial license
 QT5WEBSOCKETS_REDISTRIBUTE = NO
