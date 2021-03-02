From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  2 Mar 2021 08:07:08 +0100
Subject: [Buildroot] [PATCH v2 13/54] package/kodi-peripheral-xarcade: bump
 version to 1.2.0-Matrix
In-Reply-To: <20210302070749.647742-1-bernd.kuhls@t-online.de>
References: <20210302070749.647742-1-bernd.kuhls@t-online.de>
Message-ID: <20210302070749.647742-14-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash | 4 ++--
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
index 7443ac65d8..a971493c02 100644
--- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c1d755230b0f2fe943cf7297a6d187371088f39391944d422d2bf5969c8863c1  kodi-peripheral-xarcade-51e1a4550a6c7d7feeb01760a731af17bea6c524.tar.gz
-sha256  848ad4f3a480c953b556467fb9a315dd352ec1d267e012144c46adc571e39efb  debian/copyright
+sha256  6fa8e1d0e6ebb6c385a7aef6e6c7629d2f1f52601ade7839093c1c3abb844894  kodi-peripheral-xarcade-1.2.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
index 42d7af8a02..fe5a9e41a0 100644
--- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_XARCADE_VERSION = 51e1a4550a6c7d7feeb01760a731af17bea6c524
+KODI_PERIPHERAL_XARCADE_VERSION = 1.2.0-Matrix
 KODI_PERIPHERAL_XARCADE_SITE = $(call github,kodi-game,peripheral.xarcade,$(KODI_PERIPHERAL_XARCADE_VERSION))
 KODI_PERIPHERAL_XARCADE_LICENSE = GPL-2.0+
-KODI_PERIPHERAL_XARCADE_LICENSE_FILES = debian/copyright
+KODI_PERIPHERAL_XARCADE_LICENSE_FILES = LICENSE.md
 KODI_PERIPHERAL_XARCADE_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
-- 
2.29.2
