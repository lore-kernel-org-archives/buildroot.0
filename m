From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Jan 2019 21:18:48 +0100
Subject: [Buildroot] [git commit] rpi-userland: bump version to 7cbfbd38d9
Message-ID: <20190106201944.244A089104@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89a1398a2b0c7f8970a4b7dd9bd724e0396394f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-userland/rpi-userland.hash | 2 +-
 package/rpi-userland/rpi-userland.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
index fc135e475f..2f10993899 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 01ece7088e38864bb20a165746a43e8ceeb4fb71f7b0e6974aa5ba587b4a76b2 rpi-userland-8f0abfb07b96e7ee85f46e59d895014ec5e25f5e.tar.gz
+sha256 cf4f9ea62d0986f03af07485a9dfed6dc80253b691dedd6851b140581b72cafc rpi-userland-7cbfbd38d9824535164f93a1d32c81a33a00ca31.tar.gz
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index ede8c242eb..ea4df49a5e 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 8f0abfb07b96e7ee85f46e59d895014ec5e25f5e
+RPI_USERLAND_VERSION = 7cbfbd38d9824535164f93a1d32c81a33a00ca31
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3-Clause
 RPI_USERLAND_LICENSE_FILES = LICENCE
