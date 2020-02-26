From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 21:38:10 +0100
Subject: [Buildroot] [git commit] package/kodi-inputstream-adaptive: update
 LICENSE_FILES
Message-ID: <20200226203823.AFCC68EB3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96556bbf5176ecc74de355301e30aa307438aa25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use LICENSE.GPL instead of src/main.cpp.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index 5704976e3c..60bc0031b6 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256 e47263240ac9276546ead439ba14ee26c3f3b45f2882351a9081e5502e296329  kodi-inputstream-adaptive-2.4.2-Leia.tar.gz
-sha256 9070a4ff46077f9358b079445c5cf2109f1711e05f4b9cb283d89ecac7aad161  src/main.cpp
+sha256 89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.GPL
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 90958bdf1a..1a083b188b 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -7,7 +7,7 @@
 KODI_INPUTSTREAM_ADAPTIVE_VERSION = 2.4.2-Leia
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,peak3d,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+
-KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = src/main.cpp
+KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = LICENSE.GPL
 KODI_INPUTSTREAM_ADAPTIVE_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
