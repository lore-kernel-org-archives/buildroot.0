From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Dec 2009 17:29:59 +0100
Subject: [Buildroot] [git commit master] package/qt: fix download URL
Message-ID: <20091214163130.47ACB7777C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=77ea6b03f5afee3917437185cf5e9f8038327a04
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

get.qtsoftware.com doesn't seem to work any more. The links on the Qt
website now points to get.qt.nokia.com, so use that instead.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index d69930b..105998f 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -14,7 +14,7 @@
 
 QT_VERSION:=4.5.2
 QT_SOURCE:=qt-embedded-linux-opensource-src-$(QT_VERSION).tar.bz2
-QT_SITE:=http://get.qtsoftware.com/qt/source
+QT_SITE:=http://get.qt.nokia.com/qt/source
 QT_CAT:=$(BZCAT)
 QT_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-opensource-src-$(QT_VERSION)
 
-- 
1.6.3.3
