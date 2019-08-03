From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Aug 2019 22:00:36 +0200
Subject: [Buildroot] [git commit] package/libhdhomerun: bump version to
 20190621
Message-ID: <20190803200438.32B648DF20@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6daa90db412bc0b6548fc6fb83ca1a24ba30e9d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
