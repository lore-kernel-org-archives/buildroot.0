From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  9 Mar 2020 19:39:28 +0100
Subject: [Buildroot] [PATCH 06/16] package/kodi-inputstream-adaptive: bump
 version to 2.4.3-Leia
In-Reply-To: <20200309183938.2528-1-bernd.kuhls@t-online.de>
References: <20200309183938.2528-1-bernd.kuhls@t-online.de>
Message-ID: <20200309183938.2528-6-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index 60bc0031b6..4cdfe5aeac 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 e47263240ac9276546ead439ba14ee26c3f3b45f2882351a9081e5502e296329  kodi-inputstream-adaptive-2.4.2-Leia.tar.gz
+sha256 83c3d1c45ed5f63d95ca8fa93fcf57fb249586987f9fe74ef4857ca660ed2f64  kodi-inputstream-adaptive-2.4.3-Leia.tar.gz
 sha256 89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.GPL
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 1a083b188b..bf7f64ca72 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 2.4.2-Leia
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 2.4.3-Leia
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,peak3d,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = LICENSE.GPL
-- 
2.25.0
