From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  5 Jul 2021 22:45:49 +0200
Subject: [Buildroot] [PATCH 10/17] package/kodi-pvr-njoy: bump version to
 7.1.1-Matrix
In-Reply-To: <20210705204556.20874-1-bernd.kuhls@t-online.de>
References: <20210705204556.20874-1-bernd.kuhls@t-online.de>
Message-ID: <20210705204556.20874-10-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://github.com/kodi-pvr/pvr.njoy/blob/Matrix/pvr.njoy/changelog.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-njoy/kodi-pvr-njoy.hash | 2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
index 76e5e988db..5b3f0a58d3 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  26134e815efd38fa09507a6119e6463c4785a78a417e253558d23a94a9989613  kodi-pvr-njoy-7.1.0-Matrix.tar.gz
+sha256  6a7edf45bfe0e9bad0fe460accf9a9c0bbb93a907c2becf5e48dcc79a803cc8b  kodi-pvr-njoy-7.1.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
index 17a69af73b..6f4f54c955 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_NJOY_VERSION = 7.1.0-Matrix
+KODI_PVR_NJOY_VERSION = 7.1.1-Matrix
 KODI_PVR_NJOY_SITE = $(call github,kodi-pvr,pvr.njoy,$(KODI_PVR_NJOY_VERSION))
 KODI_PVR_NJOY_LICENSE = GPL-2.0+
 KODI_PVR_NJOY_LICENSE_FILES = LICENSE.md
-- 
2.30.2
