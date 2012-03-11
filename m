From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Mar 2012 21:27:40 +0100
Subject: [Buildroot] [git commit] bluez_utils: bump to 4.99
Message-ID: <20120311203130.8625190D3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ab7f49529d18ac079e595003794806e8b87d156
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bluez_utils/bluez_utils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/bluez_utils/bluez_utils.mk b/package/bluez_utils/bluez_utils.mk
index 025f31a..eb42e23 100644
--- a/package/bluez_utils/bluez_utils.mk
+++ b/package/bluez_utils/bluez_utils.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BLUEZ_UTILS_VERSION = 4.98
+BLUEZ_UTILS_VERSION = 4.99
 BLUEZ_UTILS_SOURCE = bluez-$(BLUEZ_UTILS_VERSION).tar.gz
 BLUEZ_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ_UTILS_INSTALL_STAGING = YES
