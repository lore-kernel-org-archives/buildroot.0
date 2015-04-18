From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 18:40:17 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_xmore: bump version to
	1.0.2, add hash
Message-ID: <20150418170659.6AC4A80E0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b7fdb52826816a0e1d7c70751e6e869d0841641c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xmore/xapp_xmore.hash |    2 ++
 package/x11r7/xapp_xmore/xapp_xmore.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xmore/xapp_xmore.hash b/package/x11r7/xapp_xmore/xapp_xmore.hash
new file mode 100644
index 0000000..f2b7d1a
--- /dev/null
+++ b/package/x11r7/xapp_xmore/xapp_xmore.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2010-July/001360.html
+sha1	7db4e5feb82d5d05038722d3af00d28e103bed18	xmore-1.0.2.tar.bz2
diff --git a/package/x11r7/xapp_xmore/xapp_xmore.mk b/package/x11r7/xapp_xmore/xapp_xmore.mk
index 05dfdce..b0b0edf 100644
--- a/package/x11r7/xapp_xmore/xapp_xmore.mk
+++ b/package/x11r7/xapp_xmore/xapp_xmore.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XMORE_VERSION = 1.0.1
+XAPP_XMORE_VERSION = 1.0.2
 XAPP_XMORE_SOURCE = xmore-$(XAPP_XMORE_VERSION).tar.bz2
 XAPP_XMORE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMORE_LICENSE = MIT
