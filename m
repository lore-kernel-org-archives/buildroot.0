From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 27 Jan 2019 18:08:08 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/rpi-userland: bump version to
 e5803f2c98
In-Reply-To: <20190127170808.7860-1-ps.report@gmx.net>
References: <20190127170808.7860-1-ps.report@gmx.net>
Message-ID: <20190127170808.7860-2-ps.report@gmx.net>
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
index 2f10993899..44d446ea3e 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 cf4f9ea62d0986f03af07485a9dfed6dc80253b691dedd6851b140581b72cafc rpi-userland-7cbfbd38d9824535164f93a1d32c81a33a00ca31.tar.gz
+sha256 9424ffa45ef888fb61483c63fd66532c1c648e071fea72c93762efbb3c2a8669 rpi-userland-e5803f2c986cbf8c919c60278b3231dcdf4271a6.tar.gz
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index ea4df49a5e..20ef2fca98 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 7cbfbd38d9824535164f93a1d32c81a33a00ca31
+RPI_USERLAND_VERSION = e5803f2c986cbf8c919c60278b3231dcdf4271a6
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3-Clause
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
2.20.1
