From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Aug 2019 21:24:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/libhdhomerun: bump version to
 20190621
Message-ID: <20190803192457.1214-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libhdhomerun/libhdhomerun.hash | 2 +-
 package/libhdhomerun/libhdhomerun.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libhdhomerun/libhdhomerun.hash b/package/libhdhomerun/libhdhomerun.hash
index b7ad5b52e3..8b45486a12 100644
--- a/package/libhdhomerun/libhdhomerun.hash
+++ b/package/libhdhomerun/libhdhomerun.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 437888b27206f526827ee7a4c57c1c167a36483b0445232e07fb7bb7ee854b42  libhdhomerun_20180817.tgz
+sha256 9a60f663b00de5f820bdb85806662e25f22da248b14942e33a8b43a0331f855a  libhdhomerun_20190621.tgz
 sha256 9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/libhdhomerun/libhdhomerun.mk b/package/libhdhomerun/libhdhomerun.mk
index 96be54a782..8281b2462b 100644
--- a/package/libhdhomerun/libhdhomerun.mk
+++ b/package/libhdhomerun/libhdhomerun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHDHOMERUN_VERSION = 20180817
+LIBHDHOMERUN_VERSION = 20190621
 LIBHDHOMERUN_SOURCE = libhdhomerun_$(LIBHDHOMERUN_VERSION).tgz
 LIBHDHOMERUN_SITE = http://download.silicondust.com/hdhomerun
 LIBHDHOMERUN_LICENSE = LGPL-2.1+
-- 
2.20.1
