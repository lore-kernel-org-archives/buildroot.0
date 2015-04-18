From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 18:30:17 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_xmag: bump version to
	1.0.6, add hash
Message-ID: <20150418163309.5328D7FA95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9585e9dce07e502aff6eed908c56178746122f44
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xmag/xapp_xmag.hash |    2 ++
 package/x11r7/xapp_xmag/xapp_xmag.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xmag/xapp_xmag.hash b/package/x11r7/xapp_xmag/xapp_xmag.hash
new file mode 100644
index 0000000..ccfeb32
--- /dev/null
+++ b/package/x11r7/xapp_xmag/xapp_xmag.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-April/002581.html
+sha256	87a2bc23b251e2d8f8370d3283a4d6c8dac98a30cb5749a04336cdb55c14e161	xmag-1.0.6.tar.bz2
diff --git a/package/x11r7/xapp_xmag/xapp_xmag.mk b/package/x11r7/xapp_xmag/xapp_xmag.mk
index 9851499..bfc60c3 100644
--- a/package/x11r7/xapp_xmag/xapp_xmag.mk
+++ b/package/x11r7/xapp_xmag/xapp_xmag.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XMAG_VERSION = 1.0.5
+XAPP_XMAG_VERSION = 1.0.6
 XAPP_XMAG_SOURCE = xmag-$(XAPP_XMAG_VERSION).tar.bz2
 XAPP_XMAG_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMAG_LICENSE = MIT
