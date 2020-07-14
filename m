From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 22:55:24 +0200
Subject: [Buildroot] [git commit] package/zd1211-firmware: bump version to
 1.5
Message-ID: <20200714205225.D2A2086D80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9022485310cae337341f0268c3c431d182ff4029
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zd1211-firmware/zd1211-firmware.hash | 2 +-
 package/zd1211-firmware/zd1211-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zd1211-firmware/zd1211-firmware.hash b/package/zd1211-firmware/zd1211-firmware.hash
index 2b59b8ac2a..14e2c710ae 100644
--- a/package/zd1211-firmware/zd1211-firmware.hash
+++ b/package/zd1211-firmware/zd1211-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  866308f6f59f7075f075d4959dff2ede47735c751251fecd1496df1ba4d338e1  zd1211-firmware-1.4.tar.bz2
+sha256  f11d3810d7f72833997f634584a586dcced71a353f965abf81062ec431d02b12  zd1211-firmware-1.5.tar.bz2
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/zd1211-firmware/zd1211-firmware.mk b/package/zd1211-firmware/zd1211-firmware.mk
index 860aa76ce5..1836a9f7c5 100644
--- a/package/zd1211-firmware/zd1211-firmware.mk
+++ b/package/zd1211-firmware/zd1211-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZD1211_FIRMWARE_VERSION = 1.4
+ZD1211_FIRMWARE_VERSION = 1.5
 ZD1211_FIRMWARE_SITE = http://downloads.sourceforge.net/project/zd1211/zd1211-firmware/$(ZD1211_FIRMWARE_VERSION)
 ZD1211_FIRMWARE_SOURCE = zd1211-firmware-$(ZD1211_FIRMWARE_VERSION).tar.bz2
 ZD1211_FIRMWARE_LICENSE = GPL-2.0
