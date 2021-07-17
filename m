From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 Jul 2021 20:27:37 +0200
Subject: [Buildroot] [PATCH 3/5] package/kodi-visualisation-spectrum: bump
 version to 19.0.0-Matrix
In-Reply-To: <20210717182739.7558-1-bernd.kuhls@t-online.de>
References: <20210717182739.7558-1-bernd.kuhls@t-online.de>
Message-ID: <20210717182739.7558-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-visualisation-spectrum.hash                            | 2 +-
 .../kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
index e6473ab0a1..d770b40092 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0b08b99c0289a421425a5d3b39eafdf6262021e213bd3093e98704efb410d348  kodi-visualisation-spectrum-3.4.0-Matrix.tar.gz
+sha256  32b130c26581c224e9b43672ccb5c947f2f4982e6d2ab12e389b41a9ceeb0e3f  kodi-visualisation-spectrum-19.0.0-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
index 42abc156cd..ca01ea270c 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SPECTRUM_VERSION = 3.4.0-Matrix
+KODI_VISUALISATION_SPECTRUM_VERSION = 19.0.0-Matrix
 KODI_VISUALISATION_SPECTRUM_SITE = $(call github,xbmc,visualization.spectrum,$(KODI_VISUALISATION_SPECTRUM_VERSION))
 KODI_VISUALISATION_SPECTRUM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_SPECTRUM_LICENSE_FILES = LICENSE.md
-- 
2.30.2
