From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 20 Jun 2012 22:37:22 +0200
Subject: [Buildroot] [git commit] qt: bump to 4.8.2
Message-ID: <20120620210019.83B2A8213E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=81e0952d9ece82d992070cc8215553d396897e4f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also switch to the new upstream URL.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index ff9f4ca..6b1be83 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -11,9 +11,9 @@
 #
 ######################################################################
 
-QT_VERSION = 4.8.1
+QT_VERSION = 4.8.2
 QT_SOURCE  = qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
-QT_SITE    = http://get.qt.nokia.com/qt/source
+QT_SITE    = http://releases.qt-project.org/qt4/source
 QT_DEPENDENCIES = host-pkg-config
 QT_INSTALL_STAGING = YES
 
