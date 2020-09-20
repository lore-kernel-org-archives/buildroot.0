From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 15:01:44 +0200
Subject: [Buildroot] [git commit] package/kodi-visualisation-goom: bump
 version to 2.2.3-Leia
Message-ID: <20200920125535.606D1826C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3bb09a61603044b7681618317ed26db65475441
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-visualisation-goom/kodi-visualisation-goom.hash | 2 +-
 package/kodi-visualisation-goom/kodi-visualisation-goom.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
index c7c45ab64d..c9fa7dea9f 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  14b948e7e3b6e4b9c5d7a8438fe076480483d2a515047401a1769e82858ef245  kodi-visualisation-goom-2.2.2-Leia.tar.gz
+sha256  fdd656721f6d1b1962fd0a1e240eafb4710237ba70809dd0391cd10cacf4417c  kodi-visualisation-goom-2.2.3-Leia.tar.gz
 sha256  a6b36f495079206146ae0b11624a8db49a538f421ffe1341f8651c9e6b06f0b0  debian/copyright
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
index 9883ef8c38..d83f857ae1 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_GOOM_VERSION = 2.2.2-Leia
+KODI_VISUALISATION_GOOM_VERSION = 2.2.3-Leia
 KODI_VISUALISATION_GOOM_SITE = $(call github,xbmc,visualization.goom,$(KODI_VISUALISATION_GOOM_VERSION))
 KODI_VISUALISATION_GOOM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_GOOM_LICENSE_FILES = debian/copyright
