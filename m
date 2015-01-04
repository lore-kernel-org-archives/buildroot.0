From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jan 2015 18:28:43 +0100
Subject: [Buildroot] [git commit] package/kodi-audioencoder-vorbis: bump
	version
Message-ID: <20150104172915.2C9A58043B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a61b747686280c16525c293ec2ca34cc1b87591f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../kodi-audioencoder-vorbis.mk                    |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
index 901a7a1..f1864e2 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_VORBIS_VERSION = fa0de1562504253acf64ad39fbcb1e5d85676ae4
+KODI_AUDIOENCODER_VORBIS_VERSION = 787d4a048be7fe8191afda8005a209976724dda1
 KODI_AUDIOENCODER_VORBIS_SITE = $(call github,xbmc,audioencoder.vorbis,$(KODI_AUDIOENCODER_VORBIS_VERSION))
 KODI_AUDIOENCODER_VORBIS_LICENSE = GPLv2+
 KODI_AUDIOENCODER_VORBIS_LICENSE_FILES = src/EncoderVorbis.cpp
