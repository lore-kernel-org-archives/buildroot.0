From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Jun 2016 23:56:00 +0200
Subject: [Buildroot] [PATCH 4/5] package/rpi-userland: bump version, add hash
In-Reply-To: <1465163761-2848-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465163761-2848-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465163761-2848-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/rpi-userland/rpi-userland.hash | 2 ++
 package/rpi-userland/rpi-userland.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/rpi-userland/rpi-userland.hash

diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
new file mode 100644
index 0000000..0c6f4fd
--- /dev/null
+++ b/package/rpi-userland/rpi-userland.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 b83878c487814d7736de83dc3ede1c39fa1c84bc2da2bea00312544eff64f1dc rpi-userland-7c026fa7a4ded2c525916cc853a32731c072ed1e.tar.gz
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 2312fcf..2ebd95b 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 52eca998aa43f278314579dba4798a3fe1da46c3
+RPI_USERLAND_VERSION = 7c026fa7a4ded2c525916cc853a32731c072ed1e
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
2.8.1
