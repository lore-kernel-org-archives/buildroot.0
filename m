From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Mar 2021 11:31:11 +0100
Subject: [Buildroot] [git commit] package/kodi-inputstream-ffmpegdirect:
 bump version to 1.19.3-Matrix
Message-ID: <20210321100848.33E1B885A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39ca40b9ee6b8732322dd0912f22e0fe8b08294d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/xbmc/inputstream.ffmpegdirect/blob/Matrix/inputstream.ffmpegdirect/changelog.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash    | 2 +-
 package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
index ccb7291bb8..1eda502305 100644
--- a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
+++ b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  952eeaa7af717dd954c940feb2902b51e497cde8822222c1bfa98804ec8665c7  kodi-inputstream-ffmpegdirect-1.19.2-Matrix.tar.gz
+sha256  63610cef455cf57540a36dd92b1bd2ea38cc6bf6dd1bc94a8e4089d439172e27  kodi-inputstream-ffmpegdirect-1.19.3-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
index 80891858cf..5df8f6fbb9 100644
--- a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
+++ b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION = 1.19.2-Matrix
+KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION = 1.19.3-Matrix
 KODI_INPUTSTREAM_FFMPEGDIRECT_SITE = $(call github,xbmc,inputstream.ffmpegdirect,$(KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION))
 KODI_INPUTSTREAM_FFMPEGDIRECT_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_FFMPEGDIRECT_LICENSE_FILES = LICENSE.md
