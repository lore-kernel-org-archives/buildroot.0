From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Feb 2017 12:44:38 +0100
Subject: [Buildroot] [PATCH v3 25/38] package/kodi-adsp-freesurround: bump
	version
In-Reply-To: <20170204114451.20935-1-bernd.kuhls@t-online.de>
References: <20170204114451.20935-1-bernd.kuhls@t-online.de>
Message-ID: <20170204114451.20935-26-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-adsp-freesurround/kodi-adsp-freesurround.hash | 2 +-
 package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk   | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/kodi-adsp-freesurround/kodi-adsp-freesurround.hash b/package/kodi-adsp-freesurround/kodi-adsp-freesurround.hash
index f23717f79..2649bbdcb 100644
--- a/package/kodi-adsp-freesurround/kodi-adsp-freesurround.hash
+++ b/package/kodi-adsp-freesurround/kodi-adsp-freesurround.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 652c32d0c4b61343cbed13b6edd1ab4ad35280240a0ddb386f04adaa46986e7f kodi-adsp-freesurround-08b691d3d9a0382d2f6f789a31614fb02512036c.tar.gz
+sha256 cf6985be6839530027861b54e2146693d05e802363281ef6f8c1f352dbf94b5c  kodi-adsp-freesurround-34f50406bcba22e364711562e5b9205e57ae844b.tar.gz
diff --git a/package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk b/package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk
index 49cf67327..799cda579 100644
--- a/package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk
+++ b/package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-KODI_ADSP_FREESURROUND_VERSION = 08b691d3d9a0382d2f6f789a31614fb02512036c
+# This cset is on the branch 'Krypton'
+# When Kodi is updated, then this should be updated to the corresponding branch
+KODI_ADSP_FREESURROUND_VERSION = 34f50406bcba22e364711562e5b9205e57ae844b
 KODI_ADSP_FREESURROUND_SITE = $(call github,kodi-adsp,adsp.freesurround,$(KODI_ADSP_FREESURROUND_VERSION))
 KODI_ADSP_FREESURROUND_LICENSE = GPLv3+
 KODI_ADSP_FREESURROUND_LICENSE_FILES = LICENSE.md
-- 
2.11.0
