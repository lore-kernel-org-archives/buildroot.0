From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Sep 2012 22:56:50 +0200
Subject: [Buildroot] [git commit] linux-firmware: update to a more recent
	git snapshot
Message-ID: <20120911070828.1FCC09960A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0cf33385468889c7ec1ddbdae2c81ecabc4f9584
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This update pulls in new ath6k and realtek drivers and updates for
libertas and iwlwifi:

a707c25 Merge branch 'master' of git://dev.laptop.org/users/dsd/linux-firmware
adb6547 rtlwifi/rtl8723e: Add firmware for new driver
4e17394 linux-firmware: ath6k: add firmware for AR6004 hw1.3
bac3567 Marvell SD8787: update to v14.66.9.p96
6a08d14 Marvell SD8686: update to v9.70.20.p0
bbede96 iwlwifi: update firmware for 6205

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/linux-firmware/linux-firmware.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 23afafa..09836a4 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -3,7 +3,7 @@
 # linux-firmware
 #
 #############################################################
-LINUX_FIRMWARE_VERSION = 7560108a2c94a62056fa82d912282b901aa0904f
+LINUX_FIRMWARE_VERSION = a707c25a6e992b8ee6127a6ebab63dd063043047
 LINUX_FIRMWARE_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
