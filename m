From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 16:21:33 +0200
Subject: [Buildroot] [git commit] package/kodi-inputstream-adaptive: bump
 version
Message-ID: <20180401142135.AF20682AEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7cebb3fe0ff188b1e376cc73ebd07dc596596a02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index 78b48c16b6..15ecf494f1 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 572b2e898484a5ada74c4095539cebf43c198a3147f0f24fe350bc79db053695  kodi-inputstream-adaptive-9af21218a87572bd4ab8d8d660c11f6295144f97.tar.gz
+sha256 872a6ffefb90b6201a1e01fe5a52e05877e2040737e052b2f249725b9a8a44ff  kodi-inputstream-adaptive-c51b9a9b58a645f820883e6d99982277fc58aac5.tar.gz
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index f7a4c66e8c..ab810d3248 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 9af21218a87572bd4ab8d8d660c11f6295144f97
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = c51b9a9b58a645f820883e6d99982277fc58aac5
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,peak3d,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = src/main.cpp
