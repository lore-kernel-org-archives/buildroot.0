From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jan 2020 15:27:45 +0100
Subject: [Buildroot] [git commit] package/pigpio: Bump to version 7301
Message-ID: <20200128144851.4C2F383D45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ce1f3f217e931a31e389f62828d9d8cb730642f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pigpio/pigpio.hash | 2 +-
 package/pigpio/pigpio.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pigpio/pigpio.hash b/package/pigpio/pigpio.hash
index 51a6706a95..f20b9bf6bb 100644
--- a/package/pigpio/pigpio.hash
+++ b/package/pigpio/pigpio.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	2fc7963af418ea7f1b5b0277ebd88d2a5f60452c5929fdc6b7fb4ab4914231ca  pigpio-72.tar.gz
+sha256	87ec2ec87cb6cb0f42af47868631e657217b5927cdfbea3ad0ecdc2ca885a2d1  pigpio-7301.tar.gz
 sha256	6a90b88421a0d9b090e121daa11b3c6d55eed5eeb3281a2fcc454d6a28b5547c  UNLICENCE
diff --git a/package/pigpio/pigpio.mk b/package/pigpio/pigpio.mk
index 62cbedc01b..aed5f2744d 100644
--- a/package/pigpio/pigpio.mk
+++ b/package/pigpio/pigpio.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PIGPIO_VERSION = 72
-PIGPIO_SITE = $(call github,joan2937,pigpio,V$(PIGPIO_VERSION))
+PIGPIO_VERSION = 7301
+PIGPIO_SITE = $(call github,joan2937,pigpio,v$(PIGPIO_VERSION))
 PIGPIO_LICENSE = Unlicense
 PIGPIO_LICENSE_FILES = UNLICENCE
 PIGPIO_INSTALL_STAGING = YES
