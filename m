From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Jul 2020 21:49:51 +0200
Subject: [Buildroot] [git commit] package/libhdhomerun: bump version to
 20200521
Message-ID: <20200726194558.60A4788988@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9370ce4530ef8d2fd2d2d1b963944a7c13d5c28c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libhdhomerun/libhdhomerun.hash | 4 ++--
 package/libhdhomerun/libhdhomerun.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libhdhomerun/libhdhomerun.hash b/package/libhdhomerun/libhdhomerun.hash
index 6dd3719ff2..adbe041378 100644
--- a/package/libhdhomerun/libhdhomerun.hash
+++ b/package/libhdhomerun/libhdhomerun.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 f6493e4a643a4ba9c3b2424b7f491186efc2ba5fd93d2285d65b7c5aca676cf9  libhdhomerun_20200225.tgz
-sha256 9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
+sha256  a61038f0a78c5dcab3508927ba47ac6ec47840f3d42a2df2b02034cfd7400668  libhdhomerun_20200521.tgz
+sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/libhdhomerun/libhdhomerun.mk b/package/libhdhomerun/libhdhomerun.mk
index f7e96ddd26..7b3a232d1c 100644
--- a/package/libhdhomerun/libhdhomerun.mk
+++ b/package/libhdhomerun/libhdhomerun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHDHOMERUN_VERSION = 20200225
+LIBHDHOMERUN_VERSION = 20200521
 LIBHDHOMERUN_SOURCE = libhdhomerun_$(LIBHDHOMERUN_VERSION).tgz
 LIBHDHOMERUN_SITE = http://download.silicondust.com/hdhomerun
 LIBHDHOMERUN_LICENSE = LGPL-2.1+
