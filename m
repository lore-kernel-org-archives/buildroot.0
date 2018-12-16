From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 16:39:59 +0100
Subject: [Buildroot] [git commit] package/pigpio: bump to version 68
Message-ID: <20181216154513.94C9E86AC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=973c39c88984ed423a7bb60622ed6a6f109b00bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pigpio/pigpio.hash | 2 +-
 package/pigpio/pigpio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pigpio/pigpio.hash b/package/pigpio/pigpio.hash
index db43901483..3df55fafff 100644
--- a/package/pigpio/pigpio.hash
+++ b/package/pigpio/pigpio.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	4255310dd11ed81035b60711becad081a1eaad2905f704e3eb84e692ca7e4c3d  pigpio-V67.tar.gz
+sha256	ec980f5e672e8e9395b801fecec3fbbbc5c04182b16ee72eb9ca25a453e38062  pigpio-V68.tar.gz
 sha256	6a90b88421a0d9b090e121daa11b3c6d55eed5eeb3281a2fcc454d6a28b5547c  UNLICENCE
diff --git a/package/pigpio/pigpio.mk b/package/pigpio/pigpio.mk
index 48628a9539..3071036db4 100644
--- a/package/pigpio/pigpio.mk
+++ b/package/pigpio/pigpio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIGPIO_VERSION = V67
+PIGPIO_VERSION = V68
 PIGPIO_SITE = $(call github,joan2937,pigpio,$(PIGPIO_VERSION))
 PIGPIO_LICENSE = Unlicense
 PIGPIO_LICENSE_FILES = UNLICENCE
