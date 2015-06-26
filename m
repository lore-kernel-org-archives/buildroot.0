From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Jun 2015 10:14:12 +0200
Subject: [Buildroot] [git commit] orc: bump version
Message-ID: <20150626081429.0B840801FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f5aaf53de7a7cc9cf6d11bdb4709345632a39ce1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/orc/orc.hash |    4 ++--
 package/orc/orc.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/orc/orc.hash b/package/orc/orc.hash
index ce720cb..100f194 100644
--- a/package/orc/orc.hash
+++ b/package/orc/orc.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/gstreamer-devel/2014-December/050855.html
-sha256	767eaebce2941737b43368225ec54598b3055ca78b4dc50c4092f5fcdc0bdfe7  orc-0.4.23.tar.xz
+# From http://lists.freedesktop.org/archives/gstreamer-devel/2015-June/053346.html
+sha256	338cd493b5247300149821c6312bdf7422a3593ae98691fc75d7e4fe727bd39b  orc-0.4.24.tar.xz
diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index 0d9e78c..5d84bd0 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ORC_VERSION = 0.4.23
+ORC_VERSION = 0.4.24
 ORC_SOURCE = orc-$(ORC_VERSION).tar.xz
 ORC_SITE = http://gstreamer.freedesktop.org/data/src/orc
 ORC_LICENSE = BSD-2c, BSD-3c
