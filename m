From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 18:29:29 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_xkbprint: bump version
	to 1.0.4, add hash
Message-ID: <20150418163305.BCE3A7FCDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5456ed370579e4758122d0d1acbcfb29a2bb2754
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xkbprint/xapp_xkbprint.hash |    2 ++
 package/x11r7/xapp_xkbprint/xapp_xkbprint.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xkbprint/xapp_xkbprint.hash b/package/x11r7/xapp_xkbprint/xapp_xkbprint.hash
new file mode 100644
index 0000000..9ec83b6
--- /dev/null
+++ b/package/x11r7/xapp_xkbprint/xapp_xkbprint.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-April/002578.html
+sha256	0b3faab8fefad03dfb7e866f634cf859822801de6b5fc6cf5e0a62857ed93e12	xkbprint-1.0.4.tar.bz2
diff --git a/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk b/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
index 8d2efbc..5f2300f 100644
--- a/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
+++ b/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XKBPRINT_VERSION = 1.0.1
+XAPP_XKBPRINT_VERSION = 1.0.4
 XAPP_XKBPRINT_SOURCE = xkbprint-$(XAPP_XKBPRINT_VERSION).tar.bz2
 XAPP_XKBPRINT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBPRINT_LICENSE = MIT
