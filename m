From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Jan 2020 01:04:03 +0100
Subject: [Buildroot] [git commit] package/kodi-visualisation-waveform: bump
 version to 3.1.1-Leia
Message-ID: <20200122235422.0307881427@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=016d44dbd05594038505ee42d319c998bb6c11f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hash, moved repo to xbmc project:
https://github.com/xbmc/repo-binary-addons/commit/57b8ed5fb9b5f0368738260b762cc0bab1147172

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash | 3 ++-
 package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk   | 4 ++--
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
