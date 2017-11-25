From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Nov 2017 12:01:05 +0100
Subject: [Buildroot] [git commit] qt5webkit: fix URL for 5.6 download
Message-ID: <20171125105403.CDCDB80FBE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7780cef53540b59816852bfb89aa0c0012a36fbc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Qt community releases are not stored under submodules path
component.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5webkit/qt5webkit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 592eae9..7925b11 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -10,7 +10,7 @@ QT5WEBKIT_VERSION = 5.9.1
 QT5WEBKIT_SITE = http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules
 else
 QT5WEBKIT_VERSION = $(QT5_VERSION)
-QT5WEBKIT_SITE = http://download.qt.io/community_releases/5.6/$(QT5_VERSION)/submodules
+QT5WEBKIT_SITE = http://download.qt.io/community_releases/5.6/$(QT5_VERSION)
 endif
 
 QT5WEBKIT_SOURCE = qtwebkit-opensource-src-$(QT5WEBKIT_VERSION).tar.xz
