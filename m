From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 Jul 2021 20:27:39 +0200
Subject: [Buildroot] [PATCH 5/5] package/kodi-visualisation-waveform: bump
 version to 19.0.0-Matrix
In-Reply-To: <20210717182739.7558-1-bernd.kuhls@t-online.de>
References: <20210717182739.7558-1-bernd.kuhls@t-online.de>
Message-ID: <20210717182739.7558-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-visualisation-waveform.hash                            | 2 +-
 .../kodi-visualisation-waveform/kodi-visualisation-waveform.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
index 1255b6ed75..465ce9005e 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d9acf0a3758bfc4ee6fa492bcdcf8764519bbf0f1b6a3b10807b65a0d031e55e  kodi-visualisation-waveform-4.4.0-Matrix.tar.gz
+sha256  c0b20e5d5877c34be107df0db142d46def785acb7269e6525f39a511c5a8e030  kodi-visualisation-waveform-19.0.0-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
index 6c0ec3ac70..c66b47d60c 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_WAVEFORM_VERSION = 4.4.0-Matrix
+KODI_VISUALISATION_WAVEFORM_VERSION = 19.0.0-Matrix
 KODI_VISUALISATION_WAVEFORM_SITE = $(call github,xbmc,visualization.waveform,$(KODI_VISUALISATION_WAVEFORM_VERSION))
 KODI_VISUALISATION_WAVEFORM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_WAVEFORM_LICENSE_FILES = LICENSE.md
-- 
2.30.2
