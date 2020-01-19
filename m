From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jan 2020 12:07:34 +0100
Subject: [Buildroot] [PATCH v9 22/23] package/kodi-visualisation-waveform:
 bump version to 3.1.1-Leia
In-Reply-To: <20200119110735.1104443-1-bernd.kuhls@t-online.de>
References: <20200119110735.1104443-1-bernd.kuhls@t-online.de>
Message-ID: <20200119110735.1104443-23-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hash, moved repo to xbmc project:
https://github.com/xbmc/repo-binary-addons/commit/57b8ed5fb9b5f0368738260b762cc0bab1147172

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-visualisation-waveform.hash                          | 3 ++-
 .../kodi-visualisation-waveform.mk                            | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
index 271dc4a9e0..80808663c1 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 cf10d8d78cb2bde4a0a21bb7e467445617b46593c093ef05f336f95a048f2d54  kodi-visualisation-waveform-1.1.0.tar.gz
+sha256 c5fbf48c2251b61d9abfcd679a750199f5efc78e63fded9a1482cfd9b41d0b5b  kodi-visualisation-waveform-3.1.1-Leia.tar.gz
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
index 13a621edb0..2d65df8538 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_WAVEFORM_VERSION = 1.1.0
-KODI_VISUALISATION_WAVEFORM_SITE = $(call github,notspiff,visualization.waveform,v$(KODI_VISUALISATION_WAVEFORM_VERSION))
+KODI_VISUALISATION_WAVEFORM_VERSION = 3.1.1-Leia
+KODI_VISUALISATION_WAVEFORM_SITE = $(call github,xbmc,visualization.waveform,$(KODI_VISUALISATION_WAVEFORM_VERSION))
 KODI_VISUALISATION_WAVEFORM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_WAVEFORM_LICENSE_FILES = COPYING
 KODI_VISUALISATION_WAVEFORM_DEPENDENCIES = kodi
-- 
2.20.1
