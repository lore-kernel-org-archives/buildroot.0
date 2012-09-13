From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 13 Sep 2012 19:23:38 +0200
Subject: [Buildroot] [git commit] qt: bump version
Message-ID: <20120913172432.8E7CA99639@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4dadcf292c280f8e7aa1dc16e784d5a11274fc1b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 3b40ea4..e000ecb 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -11,7 +11,7 @@
 #
 ######################################################################
 
-QT_VERSION = 4.8.2
+QT_VERSION = 4.8.3
 QT_SOURCE  = qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
 QT_SITE    = http://releases.qt-project.org/qt4/source
 QT_DEPENDENCIES = host-pkg-config
