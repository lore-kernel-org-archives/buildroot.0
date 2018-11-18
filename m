From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Nov 2018 20:52:48 +0100
Subject: [Buildroot] [git commit] package/alsa-lib: bump to version to 1.1.7
Message-ID: <20181202071556.36F458843B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85ab94022f10a5c6e69afb570275a942fb4c5279
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Zenichi Amano <crow.misia@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-lib/alsa-lib.hash | 2 +-
 package/alsa-lib/alsa-lib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index c4f16d6df3..4373a2a592 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 5f2cd274b272cae0d0d111e8a9e363f08783329157e8dd68b3de0c096de6d724  alsa-lib-1.1.6.tar.bz2
+sha256 9d6000b882a3b2df56300521225d69717be6741b71269e488bb20a20783bdc09  alsa-lib-1.1.7.tar.bz2
 sha256 32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256 bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 98fc486e2d..9de45d2089 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.1.6
+ALSA_LIB_VERSION = 1.1.7
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
