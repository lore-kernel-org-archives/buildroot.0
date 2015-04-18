From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 18:27:22 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_xev: bump version to
	1.2.2, add hash
Message-ID: <20150418162757.6084C7F8C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9c288fb178fcae8c058efbf195500e7cc28e19cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xev/xapp_xev.hash |    2 ++
 package/x11r7/xapp_xev/xapp_xev.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xev/xapp_xev.hash b/package/x11r7/xapp_xev/xapp_xev.hash
new file mode 100644
index 0000000..4008eba
--- /dev/null
+++ b/package/x11r7/xapp_xev/xapp_xev.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-April/002572.html
+sha256	d94ae62a6c1af56c2961d71f5782076ac4116f0fa4e401420ac7e0db33dc314f	xev-1.2.2.tar.bz2
diff --git a/package/x11r7/xapp_xev/xapp_xev.mk b/package/x11r7/xapp_xev/xapp_xev.mk
index f8460a7..2a798db 100644
--- a/package/x11r7/xapp_xev/xapp_xev.mk
+++ b/package/x11r7/xapp_xev/xapp_xev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XEV_VERSION = 1.2.1
+XAPP_XEV_VERSION = 1.2.2
 XAPP_XEV_SOURCE = xev-$(XAPP_XEV_VERSION).tar.bz2
 XAPP_XEV_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XEV_LICENSE = MIT
