From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Jan 2020 20:46:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/alsa-lib: bump version to 1.2.1.2
Message-ID: <20200104194600.127891-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switched _SITE to https.

Release notes:
https://www.alsa-project.org/wiki/Changes_v1.2.1.1_v1.2.1.2

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/alsa-lib/alsa-lib.hash | 2 +-
 package/alsa-lib/alsa-lib.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index 0b8ced0124..2f34a12fb5 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 c95ac63c0aad43a6ac457d960569096b0b2ef72dc4e3737e77e3e2de87022cec  alsa-lib-1.2.1.1.tar.bz2
+sha256 958e260e3673f1f6ff6b2d2c0df3fc2e469bea5b2957163ce96ce17f23e87943  alsa-lib-1.2.1.2.tar.bz2
 sha256 32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256 bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 954cbfb241..38bd0fb70a 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.2.1.1
+ALSA_LIB_VERSION = 1.2.1.2
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
-ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
+ALSA_LIB_SITE = https://www.alsa-project.org/files/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
 ALSA_LIB_LICENSE_FILES = COPYING aserver/COPYING
 ALSA_LIB_INSTALL_STAGING = YES
-- 
2.20.1
