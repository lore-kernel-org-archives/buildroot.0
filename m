From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Nov 2014 13:51:10 +0100
Subject: [Buildroot] [git commit branch/next] libevdev: bump version to 1.3.1
Message-ID: <20141119125944.30487B4F0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=59fae9353b475d985b5412b08b233f3d0a53ea03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

See [1] and [2] for details.

[1] http://lists.freedesktop.org/archives/input-tools/2014-September/001112.html
[2] http://lists.freedesktop.org/archives/input-tools/2014-November/001123.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libevdev/libevdev.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index fde7d3c..2fc8ff7 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.2.2
+LIBEVDEV_VERSION = 1.3.1
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev/
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = X11
