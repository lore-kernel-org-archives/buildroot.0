From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Mar 2019 23:05:59 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_x11perf: bump version
 to 1.6.1
Message-ID: <20190324220643.9684B838B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d25f9afbe5fb7ac97805c54b0b794a129a7a47f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_x11perf/xapp_x11perf.hash | 9 +++++++--
 package/x11r7/xapp_x11perf/xapp_x11perf.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_x11perf/xapp_x11perf.hash b/package/x11r7/xapp_x11perf/xapp_x11perf.hash
index 8580993fdb..b472c21b1f 100644
--- a/package/x11r7/xapp_x11perf/xapp_x11perf.hash
+++ b/package/x11r7/xapp_x11perf/xapp_x11perf.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002566.html
-sha256	e87098dec1947572d70c62697a7b70bde1ab5668237d4660080eade6bc096751	x11perf-1.6.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-March/002983.html
+md5 e96b56756990c56c24d2d02c2964456b  x11perf-1.6.1.tar.bz2
+sha1 c54ebef80b6cb565397fe2e3069e0d7470027e5a  x11perf-1.6.1.tar.bz2
+sha256 1c7e0b8ffc2794b4ccf11e04d551823abe0ea47b4f7db0637390db6fbe817c34  x11perf-1.6.1.tar.bz2
+sha512 b386151bfe3d7c04ab9953ae1882f3c5b627d6d1afb9a8cfe87c58236a88883fc11bbadb2226b9aa61df84b4fce625a1c9e3d146a124ac17e8d7d605b35d9c0b  x11perf-1.6.1.tar.bz2
+# Locally computed
+sha256 f467ff659142e2eb4cb7275c48c789d249af398b09a405d3e181dcc339b3b922  COPYING
diff --git a/package/x11r7/xapp_x11perf/xapp_x11perf.mk b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
index 8cba79d97e..ec10590b73 100644
--- a/package/x11r7/xapp_x11perf/xapp_x11perf.mk
+++ b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_X11PERF_VERSION = 1.6.0
+XAPP_X11PERF_VERSION = 1.6.1
 XAPP_X11PERF_SOURCE = x11perf-$(XAPP_X11PERF_VERSION).tar.bz2
 XAPP_X11PERF_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_X11PERF_LICENSE = MIT
