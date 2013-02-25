From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 25 Feb 2013 13:26:37 -0300
Subject: [Buildroot] [PATCH] linux-firmware: switch to http url
Message-ID: <1361809597-24092-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As recommended by Yegor Yefremov for f2fs-tools some firewalls might
restrict the git port and make life harder.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-firmware/linux-firmware.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9268608..0cb08b4 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -3,8 +3,9 @@
 # linux-firmware
 #
 #############################################################
+
 LINUX_FIRMWARE_VERSION = 65a5163b8bb77bd7759efa3ca780867fcaed89b0
-LINUX_FIRMWARE_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
+LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
 # rt2501/rt61
-- 
1.7.12.4
