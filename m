From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 29 Mar 2020 15:25:31 +0200
Subject: [Buildroot] [PATCH v1 2/6] package/rpi-userland: bump version to
 6fb5973
In-Reply-To: <20200329132535.4811-1-ps.report@gmx.net>
References: <20200329132535.4811-1-ps.report@gmx.net>
Message-ID: <20200329132535.4811-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rpi-userland/rpi-userland.hash | 4 ++--
 package/rpi-userland/rpi-userland.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
index b6d9b99b3c..4a10536e74 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 cf4dff40a2f4ec38bc7e42a80b989df1bf88e12d714f7e681f83c4e5a588f5c9 rpi-userland-06bc6daa02137ca72b7a2104afad81e82a44de17.tar.gz
-sha256 bee6f1249175683d8610651706e1aa7dffcbfd3f9c4c05bc1e5ab34f313c2db5 LICENCE
+sha256  f81fe28c636178645fb406cc87f543efa828ca896df856536f7b1b4ab54dfe0e  rpi-userland-6fb59736b1ae80fc62cddfe3309c800f72e1c07e.tar.gz
+sha256  bee6f1249175683d8610651706e1aa7dffcbfd3f9c4c05bc1e5ab34f313c2db5  LICENCE
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 7dd29e88e7..efb02f719f 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 06bc6daa02137ca72b7a2104afad81e82a44de17
+RPI_USERLAND_VERSION = 6fb59736b1ae80fc62cddfe3309c800f72e1c07e
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3-Clause
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
2.26.0
