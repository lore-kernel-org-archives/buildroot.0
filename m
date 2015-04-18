From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 18:28:34 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_xhost: bump version to
	1.0.7, add hash
Message-ID: <20150418163305.A42E280DF7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be7b81cf562d1859d0dca3c632d87a6194cd4bf0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xhost/xapp_xhost.hash |    2 ++
 package/x11r7/xapp_xhost/xapp_xhost.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xhost/xapp_xhost.hash b/package/x11r7/xapp_xhost/xapp_xhost.hash
new file mode 100644
index 0000000..b714eb6
--- /dev/null
+++ b/package/x11r7/xapp_xhost/xapp_xhost.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-April/002576.html
+sha256	93e619ee15471f576cfb30c663e18f5bc70aca577a63d2c2c03f006a7837c29a	xhost-1.0.7.tar.bz2
diff --git a/package/x11r7/xapp_xhost/xapp_xhost.mk b/package/x11r7/xapp_xhost/xapp_xhost.mk
index d103133..a4bb16b 100644
--- a/package/x11r7/xapp_xhost/xapp_xhost.mk
+++ b/package/x11r7/xapp_xhost/xapp_xhost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XHOST_VERSION = 1.0.6
+XAPP_XHOST_VERSION = 1.0.7
 XAPP_XHOST_SOURCE = xhost-$(XAPP_XHOST_VERSION).tar.bz2
 XAPP_XHOST_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XHOST_LICENSE = MIT
