From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Jun 2014 23:12:57 +0200
Subject: [Buildroot] [git commit] package/linux-firmware: bump version
Message-ID: <20140601211500.041089CE00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7c9b0728fbef44095e74049df9e258201cc94a1a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump brings in a new version of the iwlwifi firmware.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/linux-firmware.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9c7e05c..9f36591 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = f8c22c692bdee57a20b092e647464ff6176df3ed
+LINUX_FIRMWARE_VERSION = 4a050f5524a09c35192273e3a5d741f63e7bf7d6
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
