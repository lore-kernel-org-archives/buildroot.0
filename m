From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 16 Feb 2020 12:00:28 +0100
Subject: [Buildroot] [PATCH 3/3] package/kodi-inputstream-rtmp: bump version
 to 2.0.9
In-Reply-To: <20200216110028.779166-1-bernd.kuhls@t-online.de>
References: <20200216110028.779166-1-bernd.kuhls@t-online.de>
Message-ID: <20200216110028.779166-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash | 2 +-
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
index c984f44e76..ba6ae0d91d 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 69f63289bd560f8491fca32e98603afd05a6c94f0791856d873a36285d54c185  kodi-inputstream-rtmp-2.0.8-Leia.tar.gz
+sha256 56dac63262fa736620863900d903616d4827d735992e6d8beda84e377a5599e5  kodi-inputstream-rtmp-2.0.9-Leia.tar.gz
 sha256 ddba7d22c2586f13de40786c21f3b87c6913c9937f4862dc828d33cfff0395eb  debian/copyright
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
index 6b62e6eb00..e850be40ff 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_RTMP_VERSION = 2.0.8-Leia
+KODI_INPUTSTREAM_RTMP_VERSION = 2.0.9-Leia
 KODI_INPUTSTREAM_RTMP_SITE = $(call github,xbmc,inputstream.rtmp,$(KODI_INPUTSTREAM_RTMP_VERSION))
 KODI_INPUTSTREAM_RTMP_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_RTMP_LICENSE_FILES = debian/copyright
-- 
2.20.1
