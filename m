From: Peter Seiderer <ps.report@gmx.net>
Date: Sun,  2 May 2021 11:48:27 +0200
Subject: [Buildroot] [PATCH v1 3/5] package/rpi-userland: bump version to
 45a0022
In-Reply-To: <20210502094829.8292-1-ps.report@gmx.net>
References: <20210502094829.8292-1-ps.report@gmx.net>
Message-ID: <20210502094829.8292-3-ps.report@gmx.net>
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
index 63b1bb0f41..91f1f0a964 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b23fc0849d282a8ba27b821cb8f63fa2ebc2ae8aa3cba0664ce3809ea814507b  rpi-userland-093b30bbc2fd083d68cc3ee07e6e555c6e592d11.tar.gz
+sha256  61b5c22789bf3d7e2725588529bc417275be47071b76e701673ea26963c20328  rpi-userland-45a0022ac64b4d0788def3c5230c972430f6fc23.tar.gz
 sha256  bee6f1249175683d8610651706e1aa7dffcbfd3f9c4c05bc1e5ab34f313c2db5  LICENCE
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 0118da5652..4e57fbadbf 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 093b30bbc2fd083d68cc3ee07e6e555c6e592d11
+RPI_USERLAND_VERSION = 45a0022ac64b4d0788def3c5230c972430f6fc23
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3-Clause
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
2.31.1
