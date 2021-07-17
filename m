From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 Jul 2021 20:27:36 +0200
Subject: [Buildroot] [PATCH 2/5] package/kodi-inputstream-ffmpegdirect: bump
 version to 1.21.7-Matrix
In-Reply-To: <20210717182739.7558-1-bernd.kuhls@t-online.de>
References: <20210717182739.7558-1-bernd.kuhls@t-online.de>
Message-ID: <20210717182739.7558-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Changelog:
https://github.com/xbmc/inputstream.ffmpegdirect/blob/Matrix/inputstream.ffmpegdirect/changelog.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-inputstream-ffmpegdirect.hash                          | 2 +-
 .../kodi-inputstream-ffmpegdirect.mk                            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
index 01d2988c25..ba282caa8e 100644
--- a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
+++ b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  72d07be3705820f264bf9b0942b0ba15f0a40a5867e976c15d017b408b4a122b  kodi-inputstream-ffmpegdirect-1.21.6-Matrix.tar.gz
+sha256  73a21a8556c4270596f059ba26a77a071571ff87be670cddae25b61ee97617bb  kodi-inputstream-ffmpegdirect-1.21.7-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
index b1673bed4a..cccc557694 100644
--- a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
+++ b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION = 1.21.6-Matrix
+KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION = 1.21.7-Matrix
 KODI_INPUTSTREAM_FFMPEGDIRECT_SITE = $(call github,xbmc,inputstream.ffmpegdirect,$(KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION))
 KODI_INPUTSTREAM_FFMPEGDIRECT_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_FFMPEGDIRECT_LICENSE_FILES = LICENSE.md
-- 
2.30.2
