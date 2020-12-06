From: Peter Seiderer <ps.report@gmx.net>
Date: Sun,  6 Dec 2020 12:42:48 +0100
Subject: [Buildroot] [PATCH v1 5/5] package/rpi-userland: bump version to
 093b30b
In-Reply-To: <20201206114248.24700-1-ps.report@gmx.net>
References: <20201206114248.24700-1-ps.report@gmx.net>
Message-ID: <20201206114248.24700-6-ps.report@gmx.net>
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
index 83d7fce54f..63b1bb0f41 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  024cafd2f4428e96bff1d29a782db1d484d4f1835f64097ca1bd0dc38f75e84f  rpi-userland-f73fca015d421b763936667a0b58fe5024d59921.tar.gz
+sha256  b23fc0849d282a8ba27b821cb8f63fa2ebc2ae8aa3cba0664ce3809ea814507b  rpi-userland-093b30bbc2fd083d68cc3ee07e6e555c6e592d11.tar.gz
 sha256  bee6f1249175683d8610651706e1aa7dffcbfd3f9c4c05bc1e5ab34f313c2db5  LICENCE
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 4cfd5cb832..0118da5652 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = f73fca015d421b763936667a0b58fe5024d59921
+RPI_USERLAND_VERSION = 093b30bbc2fd083d68cc3ee07e6e555c6e592d11
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3-Clause
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
2.29.2
