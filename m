From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 18:29:45 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_xlsatoms: bump version
	to 1.1.2, add hash
Message-ID: <20150418163305.C78437FCDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c0d8c54fb3636b3652f0362911f5a31de9eb55b8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xlsatoms/xapp_xlsatoms.hash |    2 ++
 package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.hash b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.hash
new file mode 100644
index 0000000..58d0737
--- /dev/null
+++ b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-April/002579.html
+sha256	47e5dc7c3dbda6db2cf8c00cedac1722835c1550aa21cfdbc9ba83906694dea4	xlsatoms-1.1.2.tar.bz2
diff --git a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
index 13c93d5..d6d9338 100644
--- a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
+++ b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XLSATOMS_VERSION = 1.1.1
+XAPP_XLSATOMS_VERSION = 1.1.2
 XAPP_XLSATOMS_SOURCE = xlsatoms-$(XAPP_XLSATOMS_VERSION).tar.bz2
 XAPP_XLSATOMS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLSATOMS_LICENSE = MIT
