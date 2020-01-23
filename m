From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Jan 2020 01:04:02 +0100
Subject: [Buildroot] [git commit] package/kodi-peripheral-*: mass version
 bump
Message-ID: <20200122235421.3166A8387B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e19d89f389eb73d1187a5152adca9ed5a45d3691
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../kodi-peripheral-steamcontroller.hash                                | 2 +-
 .../kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.mk  | 2 +-
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash            | 2 +-
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk              | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.hash b/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.hash
index c0b3bf6e22..5966ee8908 100644
--- a/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.hash
+++ b/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 d5547b78ba84c9743c884a9377c398b540bfcf23e467e1edf8be2625d400c205  kodi-peripheral-steamcontroller-ef527cd81cfcd6c8342691f5c764e5c51df1fca2.tar.gz
+sha256 26edbe8778d9267cb35f18e44b7e9cbd3d3c193710edc9e586b20eed5f4ff0f8  kodi-peripheral-steamcontroller-0347e66dc8464184d636aea2cfe10491d6fcda96.tar.gz
diff --git a/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.mk b/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.mk
index 98cccc8520..1b244602af 100644
--- a/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.mk
+++ b/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_STEAMCONTROLLER_VERSION = ef527cd81cfcd6c8342691f5c764e5c51df1fca2
+KODI_PERIPHERAL_STEAMCONTROLLER_VERSION = 0347e66dc8464184d636aea2cfe10491d6fcda96
 KODI_PERIPHERAL_STEAMCONTROLLER_SITE = $(call github,kodi-game,peripheral.steamcontroller,$(KODI_PERIPHERAL_STEAMCONTROLLER_VERSION))
 KODI_PERIPHERAL_STEAMCONTROLLER_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_STEAMCONTROLLER_LICENSE_FILES = src/addon.cpp
diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
index 48dc5a0415..ec01bfdf76 100644
--- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 cd503e7f1413214693c28b59f19f3fffe0a54cff5c29d43b2eca9bb31c10edeb  kodi-peripheral-xarcade-f1875ba4b7aa6ce85ec40fedf48ed5501c79e5fd.tar.gz
+sha256 c1d755230b0f2fe943cf7297a6d187371088f39391944d422d2bf5969c8863c1  kodi-peripheral-xarcade-51e1a4550a6c7d7feeb01760a731af17bea6c524.tar.gz
diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
index c4ddba3eb5..0946a90d7b 100644
--- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_XARCADE_VERSION = f1875ba4b7aa6ce85ec40fedf48ed5501c79e5fd
+KODI_PERIPHERAL_XARCADE_VERSION = 51e1a4550a6c7d7feeb01760a731af17bea6c524
 KODI_PERIPHERAL_XARCADE_SITE = $(call github,kodi-game,peripheral.xarcade,$(KODI_PERIPHERAL_XARCADE_VERSION))
 KODI_PERIPHERAL_XARCADE_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_XARCADE_LICENSE_FILES = src/addon.cpp
