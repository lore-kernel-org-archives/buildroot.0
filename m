From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  5 May 2021 17:58:18 +0200
Subject: [Buildroot] [PATCH 2/2] package/kodi-inputstream-ffmpegdirect: bump
 version to 1.21.2-Matrix
In-Reply-To: <20210505155818.77839-1-bernd.kuhls@t-online.de>
References: <20210505155818.77839-1-bernd.kuhls@t-online.de>
Message-ID: <20210505155818.77839-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://github.com/xbmc/inputstream.ffmpegdirect/blob/Matrix/inputstream.ffmpegdirect/changelog.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-inputstream-ffmpegdirect.hash                          | 2 +-
 .../kodi-inputstream-ffmpegdirect.mk                            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
index 2ca1dc2f8b..546b9fa490 100644
--- a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
+++ b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6fe20c67556f6dc3bdd0e0cb64db2c78b377bbbbda00dfbac2f0e6835f61c90f  kodi-inputstream-ffmpegdirect-1.21.0-Matrix.tar.gz
+sha256  b1a6131f5bdf849a4de8db84144e554e1a196d9132970c720febb90198edec01  kodi-inputstream-ffmpegdirect-1.21.2-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
index 57e9c60ce5..aeb72f048d 100644
--- a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
+++ b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION = 1.21.0-Matrix
+KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION = 1.21.2-Matrix
 KODI_INPUTSTREAM_FFMPEGDIRECT_SITE = $(call github,xbmc,inputstream.ffmpegdirect,$(KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION))
 KODI_INPUTSTREAM_FFMPEGDIRECT_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_FFMPEGDIRECT_LICENSE_FILES = LICENSE.md
-- 
2.29.2
