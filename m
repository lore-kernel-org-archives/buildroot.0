From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 May 2014 09:24:57 +0200
Subject: [Buildroot] [git commit] qt5webkit: needs host-flex
Message-ID: <20140531072534.5A9CB9CE56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ad6db5b7478d76907f7c04f59be6c6c4d1e126d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/dbe/dbe4e8f7b7ddd8ab3fdc1a6f41d775b3c8132160/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5webkit/qt5webkit.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 300b9d9..33b775d 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -7,7 +7,7 @@
 QT5WEBKIT_VERSION = $(QT5_VERSION)
 QT5WEBKIT_SITE = $(QT5_SITE)
 QT5WEBKIT_SOURCE = qtwebkit-opensource-src-$(QT5WEBKIT_VERSION).tar.xz
-QT5WEBKIT_DEPENDENCIES = qt5base sqlite host-ruby host-gperf host-bison
+QT5WEBKIT_DEPENDENCIES = qt5base sqlite host-ruby host-gperf host-bison host-flex
 QT5WEBKIT_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
