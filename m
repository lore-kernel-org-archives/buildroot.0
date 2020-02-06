From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  6 Feb 2020 19:19:39 +0100
Subject: [Buildroot] [PATCH 3/4] package/kodi-peripheral-steamcontroller:
 bump version
In-Reply-To: <20200206181940.84202-1-bernd.kuhls@t-online.de>
References: <20200206181940.84202-1-bernd.kuhls@t-online.de>
Message-ID: <20200206181940.84202-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switched _LICENSE_FILES to debian/copyright.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-peripheral-steamcontroller.hash                      | 4 ++--
 .../kodi-peripheral-steamcontroller.mk                        | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.hash b/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.hash
index 8a44ccfdba..15706cb043 100644
--- a/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.hash
+++ b/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 26edbe8778d9267cb35f18e44b7e9cbd3d3c193710edc9e586b20eed5f4ff0f8  kodi-peripheral-steamcontroller-0347e66dc8464184d636aea2cfe10491d6fcda96.tar.gz
-sha256 e91f65473335a700e38f88138f7a9413ce0cb878cfc5810c7b9b3ecc87f8ec41  src/addon.cpp
+sha256 aece8f4b4c4360ae6b8007c9a1d1ee39d90808053bc5b2e3e08e4c5c70a7f8db  kodi-peripheral-steamcontroller-702fea828f9c5c94d0bd77dbb5fe78451edfa2ea.tar.gz
+sha256 243622a4e1a2ba091ae1d433483ad8b34a7cc337048d5bef8072fbb324fbc79a  debian/copyright
diff --git a/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.mk b/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.mk
index 1b244602af..15607145b8 100644
--- a/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.mk
+++ b/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_STEAMCONTROLLER_VERSION = 0347e66dc8464184d636aea2cfe10491d6fcda96
+KODI_PERIPHERAL_STEAMCONTROLLER_VERSION = 702fea828f9c5c94d0bd77dbb5fe78451edfa2ea
 KODI_PERIPHERAL_STEAMCONTROLLER_SITE = $(call github,kodi-game,peripheral.steamcontroller,$(KODI_PERIPHERAL_STEAMCONTROLLER_VERSION))
 KODI_PERIPHERAL_STEAMCONTROLLER_LICENSE = GPL-2.0+
-KODI_PERIPHERAL_STEAMCONTROLLER_LICENSE_FILES = src/addon.cpp
+KODI_PERIPHERAL_STEAMCONTROLLER_LICENSE_FILES = debian/copyright
 KODI_PERIPHERAL_STEAMCONTROLLER_DEPENDENCIES = kodi-platform libusb
 
 $(eval $(cmake-package))
-- 
2.20.1
