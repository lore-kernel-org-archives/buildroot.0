From: Peter Seiderer <ps.report@gmx.net>
Date: Sun,  4 Dec 2016 00:11:37 +0100
Subject: [Buildroot] [PATCH v1 6/6] rpi-userland: bump version
In-Reply-To: <20161203231137.32221-1-ps.report@gmx.net>
References: <20161203231137.32221-1-ps.report@gmx.net>
Message-ID: <20161203231137.32221-7-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rpi-userland/rpi-userland.hash | 2 +-
 package/rpi-userland/rpi-userland.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
index 389c1aeaa..74b1cc94c 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 bb79667d23743769dde120d35e6a4b69c633eb66e445b5bb2c06cd3e065750a2 rpi-userland-a1b89e91f393c7134b4cdc36431f863bb3333163.tar.gz
+sha256 202f194754ddb28ff3a726477185e90a36b3b98fdbd9889c61cdb0b470166a02 rpi-userland-bb15afe33b313fe045d52277a78653d288e04f67.tar.gz
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 4a6eb4137..b3f949c3e 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = a1b89e91f393c7134b4cdc36431f863bb3333163
+RPI_USERLAND_VERSION = bb15afe33b313fe045d52277a78653d288e04f67
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
2.11.0
