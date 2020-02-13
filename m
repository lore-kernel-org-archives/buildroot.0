From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2020 23:05:02 +0100
Subject: [Buildroot] [git commit] package/kodi-inputstream-rtmp: bump
 version to 2.0.8-Leia
Message-ID: <20200213215437.4075A8E011@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=611b08d6f4579a3467d2acd131adaf4243375d9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switched _LICENSE_FILES to debian/copyright.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash | 4 ++--
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
index d47de14f7a..c984f44e76 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 bc4cd1f4df6bc24d035c537c365977493f412acc711cf60d82179d1ef494e275  kodi-inputstream-rtmp-2.0.6-Leia.tar.gz
-sha256 8aabbb74959bcadd8b2f0c08844c287142bd3e4d386ccb2c3502a98f60cd31c1  src/RTMPStream.cpp
+sha256 69f63289bd560f8491fca32e98603afd05a6c94f0791856d873a36285d54c185  kodi-inputstream-rtmp-2.0.8-Leia.tar.gz
+sha256 ddba7d22c2586f13de40786c21f3b87c6913c9937f4862dc828d33cfff0395eb  debian/copyright
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
index dc141659ac..6b62e6eb00 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_RTMP_VERSION = 2.0.6-Leia
+KODI_INPUTSTREAM_RTMP_VERSION = 2.0.8-Leia
 KODI_INPUTSTREAM_RTMP_SITE = $(call github,xbmc,inputstream.rtmp,$(KODI_INPUTSTREAM_RTMP_VERSION))
 KODI_INPUTSTREAM_RTMP_LICENSE = GPL-2.0+
-KODI_INPUTSTREAM_RTMP_LICENSE_FILES = src/RTMPStream.cpp
+KODI_INPUTSTREAM_RTMP_LICENSE_FILES = debian/copyright
 KODI_INPUTSTREAM_RTMP_DEPENDENCIES = kodi rtmpdump
 
 $(eval $(cmake-package))
