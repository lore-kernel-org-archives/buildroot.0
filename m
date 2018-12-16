From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 12:24:14 +0100
Subject: [Buildroot] [git commit] package/hostapd: bump version to 2.7
Message-ID: <20181216112350.1A343810D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb7489dc797e49a99563ffef02f5fd6de4b7d6af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hash, removed patches included in new version.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/hostapd/hostapd.hash | 5 ++---
 package/hostapd/hostapd.mk   | 5 +----
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/hostapd/hostapd.hash b/package/hostapd/hostapd.hash
index 588879f65a..833c7aca02 100644
--- a/package/hostapd/hostapd.hash
+++ b/package/hostapd/hostapd.hash
@@ -1,5 +1,4 @@
 # Locally calculated
-sha256  01526b90c1d23bec4b0f052039cc4456c2fd19347b4d830d1d58a0a6aea7117d  hostapd-2.6.tar.gz
+sha256  21b0dda3cc3abe75849437f6b9746da461f88f0ea49dd621216936f87440a141  hostapd-2.7.tar.gz
 sha256  e204da659d0583c71af23cb9b55536fe99598ee26a44104344f456e4d17350c6  rtlxdrv.patch
-sha256  529113cc81256c6178f3c1cf25dd8d3f33e6d770e4a180bd31c6ab7e4917f40b  rebased-v2.6-0001-hostapd-Avoid-key-reinstallation-in-FT-handshake.patch
-sha256  147c8abe07606905d16404fb2d2c8849796ca7c85ed8673c09bb50038bcdeb9e  rebased-v2.6-0005-Fix-PTK-rekeying-to-generate-a-new-ANonce.patch
+sha256  76eeecd8fc291a71f29189ea20e6a34387b8048a959cbc6a65c41b98194643a2  README
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index fa8226805d..0b3fa0646f 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -4,11 +4,8 @@
 #
 ################################################################################
 
-HOSTAPD_VERSION = 2.6
+HOSTAPD_VERSION = 2.7
 HOSTAPD_SITE = http://w1.fi/releases
-HOSTAPD_PATCH = \
-	http://w1.fi/security/2017-1/rebased-v2.6-0001-hostapd-Avoid-key-reinstallation-in-FT-handshake.patch \
-	http://w1.fi/security/2017-1/rebased-v2.6-0005-Fix-PTK-rekeying-to-generate-a-new-ANonce.patch
 HOSTAPD_SUBDIR = hostapd
 HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
 HOSTAPD_DEPENDENCIES = host-pkgconf
