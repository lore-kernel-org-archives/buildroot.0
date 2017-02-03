From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  3 Feb 2017 17:20:18 +0100
Subject: [Buildroot] [PATCH v2 24/38] package/kodi-adsp-basic: bump version
In-Reply-To: <20170203162032.2923-1-bernd.kuhls@t-online.de>
References: <20170203162032.2923-1-bernd.kuhls@t-online.de>
Message-ID: <20170203162032.2923-25-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-adsp-basic/kodi-adsp-basic.hash | 2 +-
 package/kodi-adsp-basic/kodi-adsp-basic.mk   | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/kodi-adsp-basic/kodi-adsp-basic.hash b/package/kodi-adsp-basic/kodi-adsp-basic.hash
index e668ff2aa..10dd773c1 100644
--- a/package/kodi-adsp-basic/kodi-adsp-basic.hash
+++ b/package/kodi-adsp-basic/kodi-adsp-basic.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 0ae320af73085c322671d4b361248ff4341a6a04bd81c8b699847d5b04da828f kodi-adsp-basic-cb56e0eb6530fd50a286d47ef0be529001e9d556.tar.gz
+sha256 d6ef031157ceb825a6e6ba114fb20c622ef7f396ddd17ae8bf1954aab25bc2af  kodi-adsp-basic-2ae604e591346741324663260696cfa231931870.tar.gz
diff --git a/package/kodi-adsp-basic/kodi-adsp-basic.mk b/package/kodi-adsp-basic/kodi-adsp-basic.mk
index 0b1ba9594..08cc61f09 100644
--- a/package/kodi-adsp-basic/kodi-adsp-basic.mk
+++ b/package/kodi-adsp-basic/kodi-adsp-basic.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-KODI_ADSP_BASIC_VERSION = cb56e0eb6530fd50a286d47ef0be529001e9d556
+# This cset is on the branch 'Krypton'
+# When Kodi is updated, then this should be updated to the corresponding branch
+KODI_ADSP_BASIC_VERSION = 2ae604e591346741324663260696cfa231931870
 KODI_ADSP_BASIC_SITE = $(call github,kodi-adsp,adsp.basic,$(KODI_ADSP_BASIC_VERSION))
 KODI_ADSP_BASIC_LICENSE = GPLv3+
 KODI_ADSP_BASIC_LICENSE_FILES = LICENSE.md
-- 
2.11.0
