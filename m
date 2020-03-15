From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 16:06:25 +0100
Subject: [Buildroot] [git commit] package/kodi-visualisation-goom: bump
 version to 2.2.1-Leia
Message-ID: <20200315145337.B82F688090@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6420dc3c54e999c3aa8f0d1cbfc12ed209e5473b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change license file to debian/copyright, since src/Main.cpp changed
between 2.1.0 and 2.2.1.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-visualisation-goom/kodi-visualisation-goom.hash | 4 ++--
 package/kodi-visualisation-goom/kodi-visualisation-goom.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
index 4439240d7b..a6f4e41796 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 49f193d32a14b26a39d6572fcbdd8b69a9e559f453bca017086336e985bf6b2c  kodi-visualisation-goom-2.1.0-Leia.tar.gz
-sha256 e5776a7262955801be2e19a84024cf4d0589253c8d77dd09a1db01bf5ed07683  src/Main.cpp
+sha256 a02dfd844cfd5ff24f735e614a2a4727771112ce15642957a2511061f724392a  kodi-visualisation-goom-2.2.1-Leia.tar.gz
+sha256 a6b36f495079206146ae0b11624a8db49a538f421ffe1341f8651c9e6b06f0b0  debian/copyright
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
index 0184d8474c..29cd24df69 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_GOOM_VERSION = 2.1.0-Leia
+KODI_VISUALISATION_GOOM_VERSION = 2.2.1-Leia
 KODI_VISUALISATION_GOOM_SITE = $(call github,xbmc,visualization.goom,$(KODI_VISUALISATION_GOOM_VERSION))
 KODI_VISUALISATION_GOOM_LICENSE = GPL-2.0+
-KODI_VISUALISATION_GOOM_LICENSE_FILES = src/Main.cpp
+KODI_VISUALISATION_GOOM_LICENSE_FILES = debian/copyright
 
 KODI_VISUALISATION_GOOM_DEPENDENCIES = glm kodi
 
