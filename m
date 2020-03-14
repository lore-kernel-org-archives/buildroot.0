From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Mar 2020 15:45:16 +0100
Subject: [Buildroot] [git commit] package/kodi-pvr-hts: bump version to
 4.4.21-Leia
Message-ID: <20200314143331.3527F831C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe2c2cf7d368822c6195890f9721521c8b439c05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-pvr-hts/kodi-pvr-hts.hash | 2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index ffbe368637..6afcea4316 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 fcf2df3566b196addf99d8166fa5a8b77635ac905214c36071d9e778cc42978e  kodi-pvr-hts-4.4.20-Leia.tar.gz
+sha256 6958b91ca616554e4c068bc303c66388e9a2c3a68b5979d8918b4e0d7b6bb95c  kodi-pvr-hts-4.4.21-Leia.tar.gz
 sha256 a6cd848443278bf312680e08d13fa898e4242fd76de8c86aea5f09a51826885c  src/client.h
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index 0184f77ec9..bfe960b65e 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HTS_VERSION = 4.4.20-Leia
+KODI_PVR_HTS_VERSION = 4.4.21-Leia
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = src/client.h
