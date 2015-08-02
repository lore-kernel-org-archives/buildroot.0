From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Aug 2015 19:23:08 +0200
Subject: [Buildroot] [git commit branch/next] kodi-audioencoder-lame: bump
	version
Message-ID: <20150808105652.C94D57FE0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0f986356b52320e9eb16780e034f08a6f2f4bbb6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../kodi-audioencoder-lame.mk                      |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
index cfdf109..ca8c6ae 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_LAME_VERSION = b283cd50cd2f89b7fd7b903c957a6a993e3756d2
+KODI_AUDIOENCODER_LAME_VERSION = 0f612d467bdde03c6fac25d534a1a338a4f628ac
 KODI_AUDIOENCODER_LAME_SITE = $(call github,xbmc,audioencoder.lame,$(KODI_AUDIOENCODER_LAME_VERSION))
 KODI_AUDIOENCODER_LAME_LICENSE = GPLv2+
 KODI_AUDIOENCODER_LAME_LICENSE_FILES = src/EncoderLame.cpp
