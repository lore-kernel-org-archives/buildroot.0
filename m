From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  9 Mar 2020 19:39:36 +0100
Subject: [Buildroot] [PATCH 14/16] package/kodi-screensaver-pyro: bump
 version to 3.0.1-Leia
In-Reply-To: <20200309183938.2528-1-bernd.kuhls@t-online.de>
References: <20200309183938.2528-1-bernd.kuhls@t-online.de>
Message-ID: <20200309183938.2528-14-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash | 4 ++--
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
index fc41e80ee4..16a37d3161 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  55f867b703e5cf409f8e0a8a2c34373f896feb990004b5901b4efaee905d42e5  kodi-screensaver-pyro-3.0.0-Leia.tar.gz
-sha256  b945c014a69091c728caa3fca547c2747911e61e1dd2cef9928cf92a6a45655f  src/Pyro.cpp
+sha256 cf9ed582b70460682175366641e6a00eaea085a1d3477a02710ba8398a1d17bd  kodi-screensaver-pyro-3.0.1-Leia.tar.gz
+sha256 b945c014a69091c728caa3fca547c2747911e61e1dd2cef9928cf92a6a45655f  src/Pyro.cpp
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
index 7b3b63ab7f..880212ee72 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PYRO_VERSION = 3.0.0-Leia
+KODI_SCREENSAVER_PYRO_VERSION = 3.0.1-Leia
 KODI_SCREENSAVER_PYRO_SITE = $(call github,xbmc,screensaver.pyro,$(KODI_SCREENSAVER_PYRO_VERSION))
 KODI_SCREENSAVER_PYRO_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_PYRO_LICENSE_FILES = src/Pyro.cpp
-- 
2.25.0
