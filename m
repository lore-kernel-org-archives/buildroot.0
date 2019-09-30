From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 23:12:16 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_xsetpointer: bump
 version to 1.0.1
Message-ID: <20190930210853.6DA7683EB1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c1d4e3e5ab54fd750d602b47a7585a1dc245561
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xapp_xsetpointer/xapp_xsetpointer.hash | 6 +++++-
 package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk   | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.hash b/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.hash
index 6e6a37e90d..8167f3d17a 100644
--- a/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.hash
+++ b/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.hash
@@ -1,2 +1,6 @@
+# From https://lists.freedesktop.org/archives/xorg-announce/2006-November/000150.html
+md5 9e5bcbeda4aaf02bfa095e41d30baee4  xsetpointer-1.0.1.tar.bz2
+sha1 a8b01c6f27625a6f6943f9be17b1e5511f69d710  xsetpointer-1.0.1.tar.bz2
 # locally computed
-sha256  7d65f450420b4f764dcf38e4ccee9d608b5a5874706e716cb861bfe2586b7d4a  xsetpointer-1.0.0.tar.bz2
+sha256 495d88871eb5081e98bbae55f813f73cb3ce4145d6ca3e8f2826800166c04571  xsetpointer-1.0.1.tar.bz2
+sha256 8f22998f14924220f0f530660811d24e5371a8d7672287c9d22f1eafb7256863  COPYING
diff --git a/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk b/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk
index a34b7e637d..21630eb7ae 100644
--- a/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk
+++ b/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XSETPOINTER_VERSION = 1.0.0
+XAPP_XSETPOINTER_VERSION = 1.0.1
 XAPP_XSETPOINTER_SOURCE = xsetpointer-$(XAPP_XSETPOINTER_VERSION).tar.bz2
 XAPP_XSETPOINTER_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSETPOINTER_LICENSE = MIT
