From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 Apr 2021 21:03:41 +0200
Subject: [Buildroot] [PATCH 2/2] package/kodi-inputstream-ffmpegdirect: bump
 version to 1.21.0-Matrix
In-Reply-To: <20210410190341.2319895-1-bernd.kuhls@t-online.de>
References: <20210410190341.2319895-1-bernd.kuhls@t-online.de>
Message-ID: <20210410190341.2319895-2-bernd.kuhls@t-online.de>
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
index 55501c73c6..2ca1dc2f8b 100644
--- a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
+++ b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a8afc9c897c83b20548ef1f5ce9831eb5623674ead3305dafbef972dc721f082  kodi-inputstream-ffmpegdirect-1.20.1-Matrix.tar.gz
+sha256  6fe20c67556f6dc3bdd0e0cb64db2c78b377bbbbda00dfbac2f0e6835f61c90f  kodi-inputstream-ffmpegdirect-1.21.0-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
index b032e38d72..57e9c60ce5 100644
--- a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
+++ b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION = 1.20.1-Matrix
+KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION = 1.21.0-Matrix
 KODI_INPUTSTREAM_FFMPEGDIRECT_SITE = $(call github,xbmc,inputstream.ffmpegdirect,$(KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION))
 KODI_INPUTSTREAM_FFMPEGDIRECT_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_FFMPEGDIRECT_LICENSE_FILES = LICENSE.md
-- 
2.29.2
