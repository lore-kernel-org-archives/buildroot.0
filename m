From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Mar 2014 11:44:58 +0100
Subject: [Buildroot] [git commit] package/linux-firmware: bump for new
	firmwares
Message-ID: <20140311104936.84C249BEED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cdf2b6f5d9bddf22c7f4609964a1549bfb219019
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A bunch of new WiFi firmwares has been added, some have been updated.
Not limited to WiFi, but other firmwares are of less interest to
Buildroot for now (eg. radeon, myri10ge...).

Fixups in WHENCE file (the all-licenses file).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/linux-firmware.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 45c82c6..307e8ee 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 52d77db9f133afe4d2b26aeccfd603745f45fda1
+LINUX_FIRMWARE_VERSION = f8c22c692bdee57a20b092e647464ff6176df3ed
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
