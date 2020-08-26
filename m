From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Aug 2020 23:24:38 +0200
Subject: [Buildroot] [git commit branch/next]
 package/kodi-visualisation-goom: bump version to 2.2.2-Leia
Message-ID: <20200826211723.5CA2A8472A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01af465ea19f21486c107cdf427fe88d509054ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-visualisation-goom/kodi-visualisation-goom.hash | 2 +-
 package/kodi-visualisation-goom/kodi-visualisation-goom.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
index f12b0ec7c2..c7c45ab64d 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a02dfd844cfd5ff24f735e614a2a4727771112ce15642957a2511061f724392a  kodi-visualisation-goom-2.2.1-Leia.tar.gz
+sha256  14b948e7e3b6e4b9c5d7a8438fe076480483d2a515047401a1769e82858ef245  kodi-visualisation-goom-2.2.2-Leia.tar.gz
 sha256  a6b36f495079206146ae0b11624a8db49a538f421ffe1341f8651c9e6b06f0b0  debian/copyright
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
index 29cd24df69..9883ef8c38 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_GOOM_VERSION = 2.2.1-Leia
+KODI_VISUALISATION_GOOM_VERSION = 2.2.2-Leia
 KODI_VISUALISATION_GOOM_SITE = $(call github,xbmc,visualization.goom,$(KODI_VISUALISATION_GOOM_VERSION))
 KODI_VISUALISATION_GOOM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_GOOM_LICENSE_FILES = debian/copyright
