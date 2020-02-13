From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2020 23:05:46 +0100
Subject: [Buildroot] [git commit] package/kodi-peripheral-steamcontroller:
 bump version
Message-ID: <20200213215437.52330805FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7cbaa51cc2f80967b55d6ce4909bcbaee0786eaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switched _LICENSE_FILES to debian/copyright.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../kodi-peripheral-steamcontroller.hash                              | 4 ++--
 .../kodi-peripheral-steamcontroller.mk                                | 4 ++--
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
