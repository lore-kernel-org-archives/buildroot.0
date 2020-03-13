From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 13 Mar 2020 08:11:50 +0100
Subject: [Buildroot] [PATCH 1/2] package/kodi-pvr-hts: bump version to
 4.4.21-Leia
Message-ID: <20200313071151.27027-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-hts/kodi-pvr-hts.hash | 2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index 878e25b2b7..d5899f5119 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 fcf2df3566b196addf99d8166fa5a8b77635ac905214c36071d9e778cc42978e  kodi-pvr-hts-4.4.20-Leia.tar.gz
+sha256 6958b91ca616554e4c068bc303c66388e9a2c3a68b5979d8918b4e0d7b6bb95c  kodi-pvr-hts-4.4.21-Leia.tar.gz
 sha256 6d97c3d608a5d59565b567313bd3e53a1d0066ed59f4ae8e474c895d0c20e746  debian/copyright
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index 0268439824..6a25cda003 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HTS_VERSION = 4.4.20-Leia
+KODI_PVR_HTS_VERSION = 4.4.21-Leia
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = debian/copyright
-- 
2.25.0
