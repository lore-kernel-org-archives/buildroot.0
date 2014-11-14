From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 14 Nov 2014 19:31:12 +0100
Subject: [Buildroot] [PATCH v3 1/4] libevdev: bump version to 1.3.1
Message-ID: <1415989875-22535-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See [1] and [2] for details.

[1] http://lists.freedesktop.org/archives/input-tools/2014-September/001112.html
[2] http://lists.freedesktop.org/archives/input-tools/2014-November/001123.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v2 -> v3:
  - add review-by and tested-by, see [1]

Changes v1 -> v2:
  - bump to new version 1.3.1 instead of 1.3

[1] http://lists.busybox.net/pipermail/buildroot/2014-November/112085.html
---
 package/libevdev/libevdev.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.8.1.4
