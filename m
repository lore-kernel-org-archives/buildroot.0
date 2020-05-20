From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 20 May 2020 19:14:55 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/kodi-inputstream-adaptive:
 bump version to 2.4.5
Message-ID: <20200520171455.6307-1-bernd.kuhls@t-online.de>
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
index ff520781ac..561d94f37c 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 ec2264aa620faa547e589b705c0393dbbfe4a8f866215d9a9f3d5b3ceea6560e  kodi-inputstream-adaptive-2.4.4-Leia.tar.gz
+sha256 14389878598f34c9eb931ee9c7b431ddd4ee19df7368fc718c34b8bf4b56b0a1  kodi-inputstream-adaptive-2.4.5-Leia.tar.gz
 sha256 89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.GPL
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index cd34047db4..643d608640 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 2.4.4-Leia
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 2.4.5-Leia
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,peak3d,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = LICENSE.GPL
-- 
2.26.2
