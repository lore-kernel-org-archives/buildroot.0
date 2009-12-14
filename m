From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Dec 2009 17:29:59 +0100
Subject: [Buildroot] [git commit master] package/qt: bump version
Message-ID: <20091214163130.AD55F7777C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=81cb4205d053d3cf09dd0718943141500b633137
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I know 4.6.0 is out, but I don't have a setup to test it at the moment,
so lets stick with 4.5.x for now.

There's apparently no .tar.bz2 of 4.5.3.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 105998f..e4a354d 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -12,10 +12,10 @@
 #
 ######################################################################
 
-QT_VERSION:=4.5.2
-QT_SOURCE:=qt-embedded-linux-opensource-src-$(QT_VERSION).tar.bz2
+QT_VERSION:=4.5.3
+QT_SOURCE:=qt-embedded-linux-opensource-src-$(QT_VERSION).tar.gz
 QT_SITE:=http://get.qt.nokia.com/qt/source
-QT_CAT:=$(BZCAT)
+QT_CAT:=$(ZCAT)
 QT_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-opensource-src-$(QT_VERSION)
 
 QT_CONFIGURE:=#empty
-- 
1.6.3.3
