From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 11:57:51 +0200
Subject: [Buildroot] [git commit] package/kodi-adsp-basic: bump version
Message-ID: <20170429101426.958E9827B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4594a277c12e2cee732aaccf36e477143bc5336
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-adsp-basic/kodi-adsp-basic.hash | 2 +-
 package/kodi-adsp-basic/kodi-adsp-basic.mk   | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/kodi-adsp-basic/kodi-adsp-basic.hash b/package/kodi-adsp-basic/kodi-adsp-basic.hash
index e668ff2..10dd773 100644
--- a/package/kodi-adsp-basic/kodi-adsp-basic.hash
+++ b/package/kodi-adsp-basic/kodi-adsp-basic.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 0ae320af73085c322671d4b361248ff4341a6a04bd81c8b699847d5b04da828f kodi-adsp-basic-cb56e0eb6530fd50a286d47ef0be529001e9d556.tar.gz
+sha256 d6ef031157ceb825a6e6ba114fb20c622ef7f396ddd17ae8bf1954aab25bc2af  kodi-adsp-basic-2ae604e591346741324663260696cfa231931870.tar.gz
diff --git a/package/kodi-adsp-basic/kodi-adsp-basic.mk b/package/kodi-adsp-basic/kodi-adsp-basic.mk
index f51594e..bb114a4 100644
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
 KODI_ADSP_BASIC_LICENSE = GPL-3.0+
 KODI_ADSP_BASIC_LICENSE_FILES = LICENSE.md
