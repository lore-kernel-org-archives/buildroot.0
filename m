From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 15 Jul 2021 16:58:21 +0200
Subject: [Buildroot] [PATCH 5/5] package/kodi-visualisation-matrix: bump
 version to 1.0.1-Matrix
In-Reply-To: <20210715145821.41754-1-bernd.kuhls@t-online.de>
References: <20210715145821.41754-1-bernd.kuhls@t-online.de>
Message-ID: <20210715145821.41754-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Changelog:
https://github.com/xbmc/visualization.matrix/blob/Matrix/visualization.matrix/changelog.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-visualisation-matrix/kodi-visualisation-matrix.hash    | 2 +-
 package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash
index 38b9311d6e..21bc6b072c 100644
--- a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash
+++ b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fc5c4790cbf957dbf8d504ae7c43eaeca122fde6423f1135029ff053135f8fd0  kodi-visualisation-matrix-1.0.0-Matrix.tar.gz
+sha256  3a51499f60966abf75d2aec45e73d8f64322bb279bb9c4b0d6026e9f31d0fa4a  kodi-visualisation-matrix-1.0.1-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
index 153c1c15b1..58a0e0dc24 100644
--- a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
+++ b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_MATRIX_VERSION = 1.0.0-Matrix
+KODI_VISUALISATION_MATRIX_VERSION = 1.0.1-Matrix
 KODI_VISUALISATION_MATRIX_SITE = $(call github,xbmc,visualization.matrix,$(KODI_VISUALISATION_MATRIX_VERSION))
 KODI_VISUALISATION_MATRIX_LICENSE = GPL-2.0+
 KODI_VISUALISATION_MATRIX_LICENSE_FILES = LICENSE.md
-- 
2.30.2
