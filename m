From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 Jul 2021 20:27:38 +0200
Subject: [Buildroot] [PATCH 4/5] package/kodi-visualisation-starburst: bump
 version to 19.0.0-Matrix
In-Reply-To: <20210717182739.7558-1-bernd.kuhls@t-online.de>
References: <20210717182739.7558-1-bernd.kuhls@t-online.de>
Message-ID: <20210717182739.7558-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-visualisation-starburst.hash                           | 2 +-
 .../kodi-visualisation-starburst.mk                             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
index b08da9788e..25026ef61e 100644
--- a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
+++ b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fb991924b8f9a4f86d81b28ec629c131d36364f82914098356184c9ef03e753e  kodi-visualisation-starburst-2.4.0-Matrix.tar.gz
+sha256  b610919fd181dac638cbcea3f88b01a0b3522941415fde8fab51a17a88f536e2  kodi-visualisation-starburst-19.0.0-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
index f19a82bf81..421b27d7d1 100644
--- a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
+++ b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_STARBURST_VERSION = 2.4.0-Matrix
+KODI_VISUALISATION_STARBURST_VERSION = 19.0.0-Matrix
 KODI_VISUALISATION_STARBURST_SITE = $(call github,xbmc,visualization.starburst,$(KODI_VISUALISATION_STARBURST_VERSION))
 KODI_VISUALISATION_STARBURST_LICENSE = GPL-2.0+
 KODI_VISUALISATION_STARBURST_LICENSE_FILES = LICENSE.md
-- 
2.30.2
