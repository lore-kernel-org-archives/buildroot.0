From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 12:24:58 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-neomagic:
	bump version to 1.2.9
Message-ID: <20150718120024.276DC8164F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=560660d06be550aed1f1bfa52bbe58be5fdc387d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xdriver_xf86-video-neomagic.hash               |    2 ++
 .../xdriver_xf86-video-neomagic.mk                 |    5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.hash b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.hash
new file mode 100644
index 0000000..fc83066
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-May/002602.html
+sha256	72f89396b10527549337cb72a7eafb1194cf140144f9236a94ad2becdf140bf2	xf86-video-neomagic-1.2.9.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
index 85bcb2a..c307761 100644
--- a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
+++ b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_NEOMAGIC_VERSION = 6661bdd4551e4e63e983685464a277845aed3012
-XDRIVER_XF86_VIDEO_NEOMAGIC_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-neomagic
+XDRIVER_XF86_VIDEO_NEOMAGIC_VERSION = 1.2.9
+XDRIVER_XF86_VIDEO_NEOMAGIC_SOURCE = xf86-video-neomagic-$(XDRIVER_XF86_VIDEO_NEOMAGIC_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_NEOMAGIC_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NEOMAGIC_LICENSE = MIT
 XDRIVER_XF86_VIDEO_NEOMAGIC_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_NEOMAGIC_AUTORECONF = YES
