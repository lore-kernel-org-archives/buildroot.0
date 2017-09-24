From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 14:45:37 +0200
Subject: [Buildroot] [git commit] rpi-userland: bump to latest version
Message-ID: <20170924124820.5208E806B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79260e7b7a8cc16d1337e6e1c4ae18b4863d51b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rpi-userland/rpi-userland.hash | 2 +-
 package/rpi-userland/rpi-userland.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
index e8a78b9..f1bb5e6 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 46a37eaf0de598ce5804e48a5efc2120e07d753a57ed83463ebfa551562eefe6 rpi-userland-29835184aa70c13d77a11d721e934a7298bdf46a.tar.gz
+sha256 8ed745ea28ef9d5e6d2e5534acabe1ea1a6c6be9bab7f683527ce5da5a3f77cb rpi-userland-a7976021a89451de0d008aa48f16c4e88872899b.tar.gz
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 90077a1..a798795 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 29835184aa70c13d77a11d721e934a7298bdf46a
+RPI_USERLAND_VERSION = a7976021a89451de0d008aa48f16c4e88872899b
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3-Clause
 RPI_USERLAND_LICENSE_FILES = LICENCE
