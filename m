From: Peter Seiderer <ps.report@gmx.net>
Date: Sat,  5 Jan 2019 20:50:58 +0100
Subject: [Buildroot] [PATCH v1 3/3] rpi-userland: bump version to 7cbfbd38d9
In-Reply-To: <20190105195058.7322-1-ps.report@gmx.net>
References: <20190105195058.7322-1-ps.report@gmx.net>
Message-ID: <20190105195058.7322-4-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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
-- 
2.20.1
