From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Aug 2019 21:36:32 +0200
Subject: [Buildroot] [PATCH v5 15/25] package/kodi-peripheral-*: mass
 version bump
In-Reply-To: <20190803193642.17892-1-bernd.kuhls@t-online.de>
References: <20190803193642.17892-1-bernd.kuhls@t-online.de>
Message-ID: <20190803193642.17892-16-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-peripheral-steamcontroller.hash                        | 2 +-
 .../kodi-peripheral-steamcontroller.mk                          | 2 +-
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash    | 2 +-
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.hash b/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.hash
index c0b3bf6e22..50e9e6d71f 100644
--- a/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.hash
+++ b/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 d5547b78ba84c9743c884a9377c398b540bfcf23e467e1edf8be2625d400c205  kodi-peripheral-steamcontroller-ef527cd81cfcd6c8342691f5c764e5c51df1fca2.tar.gz
+sha256 8550cb5f9c94104e4ae6c5b45b0835fe7e20ae030ebbd9504a2e487c35b71cf8  kodi-peripheral-steamcontroller-884d5f0c1be70b379631d55779fdcc21e1ca2ec9.tar.gz
diff --git a/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.mk b/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.mk
index 98cccc8520..273a4dd6ba 100644
--- a/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.mk
+++ b/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_STEAMCONTROLLER_VERSION = ef527cd81cfcd6c8342691f5c764e5c51df1fca2
+KODI_PERIPHERAL_STEAMCONTROLLER_VERSION = 884d5f0c1be70b379631d55779fdcc21e1ca2ec9
 KODI_PERIPHERAL_STEAMCONTROLLER_SITE = $(call github,kodi-game,peripheral.steamcontroller,$(KODI_PERIPHERAL_STEAMCONTROLLER_VERSION))
 KODI_PERIPHERAL_STEAMCONTROLLER_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_STEAMCONTROLLER_LICENSE_FILES = src/addon.cpp
diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
index 48dc5a0415..204126af21 100644
--- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 cd503e7f1413214693c28b59f19f3fffe0a54cff5c29d43b2eca9bb31c10edeb  kodi-peripheral-xarcade-f1875ba4b7aa6ce85ec40fedf48ed5501c79e5fd.tar.gz
+sha256 75c3db29d0f327094dbce5e54e0c86d3af2202a640cf21fe284e93930c7e12de  kodi-peripheral-xarcade-d218f0dc1453477baf4ce2cc560a40736070f26c.tar.gz
diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
index c4ddba3eb5..65f8a7c6ef 100644
--- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_XARCADE_VERSION = f1875ba4b7aa6ce85ec40fedf48ed5501c79e5fd
+KODI_PERIPHERAL_XARCADE_VERSION = d218f0dc1453477baf4ce2cc560a40736070f26c
 KODI_PERIPHERAL_XARCADE_SITE = $(call github,kodi-game,peripheral.xarcade,$(KODI_PERIPHERAL_XARCADE_VERSION))
 KODI_PERIPHERAL_XARCADE_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_XARCADE_LICENSE_FILES = src/addon.cpp
-- 
2.20.1
