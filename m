From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 13 Jan 2013 19:56:46 +0100
Subject: [Buildroot] [git commit] qt: bump version to latest 4.8.4
Message-ID: <20130113192103.8D1BF99900@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8586b63ed38156578e7f6618d0ad871ad090e227
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index b09d0ed..b436ad8 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -11,7 +11,7 @@
 #
 ######################################################################
 
-QT_VERSION = 4.8.3
+QT_VERSION = 4.8.4
 QT_SOURCE  = qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
 QT_SITE    = http://releases.qt-project.org/qt4/source
 QT_DEPENDENCIES = host-pkgconf
