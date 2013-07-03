From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 3 Jul 2013 16:58:41 +0200
Subject: [Buildroot] [git commit] qt: bump version
Message-ID: <20130703150151.BA49999B45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8a0d1fd1932ebe48b19e327e2441e518252af12d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details, see http://blog.qt.digia.com/blog/2013/07/02/qt-4-8-5-released/

Also move to the (current?) official download location, as the previous
location doesn't have 4.8.5.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 71b9e4c..9325b56 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -11,9 +11,9 @@
 #
 ################################################################################
 
-QT_VERSION = 4.8.4
+QT_VERSION = 4.8.5
 QT_SOURCE  = qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
-QT_SITE    = http://releases.qt-project.org/qt4/source
+QT_SITE    = http://download.qt-project.org/official_releases/qt/4.8/$(QT_VERSION)
 QT_DEPENDENCIES = host-pkgconf
 QT_INSTALL_STAGING = YES
 
