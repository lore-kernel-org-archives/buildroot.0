From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 Feb 2020 11:11:46 +0100
Subject: [Buildroot] [git commit] package/kodi-screensaver-matrixtrails:
 remove 'v' prefix from github-fetched package
Message-ID: <20200201100136.4BBE4870BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35ba89b1095f98bad917b6524bb019f37c3dc5bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998 at free.fr: fix hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash  | 2 +-
 .../kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
index 737c522715..bde096ab0b 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 2d2c795853c5a72184bb6720247d79c48b1d9fbc97e9c2913003a707d612e3ac  kodi-screensaver-matrixtrails-v2.2.1-Leia.tar.gz
+sha256 2d2c795853c5a72184bb6720247d79c48b1d9fbc97e9c2913003a707d612e3ac  kodi-screensaver-matrixtrails-2.2.1-Leia.tar.gz
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
index 670cec3efb..674a0116e2 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_MATRIXTRAILS_VERSION = v2.2.1-Leia
-KODI_SCREENSAVER_MATRIXTRAILS_SITE = $(call github,xbmc,screensaver.matrixtrails,$(KODI_SCREENSAVER_MATRIXTRAILS_VERSION))
+KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 2.2.1-Leia
+KODI_SCREENSAVER_MATRIXTRAILS_SITE = $(call github,xbmc,screensaver.matrixtrails,v$(KODI_SCREENSAVER_MATRIXTRAILS_VERSION))
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE_FILES = src/matrixtrails.cpp
 KODI_SCREENSAVER_MATRIXTRAILS_DEPENDENCIES = kodi libsoil
