From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun,  3 Nov 2019 17:55:54 +0300
Subject: [Buildroot] [PATCH 1/9] xr819-xradio: bump version to aa01ba77
In-Reply-To: <20191103145602.1332350-1-geomatsi@gmail.com>
References: <20191103145602.1332350-1-geomatsi@gmail.com>
Message-ID: <20191103145602.1332350-2-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Out-of-tree driver has been updated to work with Linux kernels v5.x.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/xr819-xradio/xr819-xradio.hash | 2 +-
 package/xr819-xradio/xr819-xradio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xr819-xradio/xr819-xradio.hash b/package/xr819-xradio/xr819-xradio.hash
index 341747c5b5..393780fb30 100644
--- a/package/xr819-xradio/xr819-xradio.hash
+++ b/package/xr819-xradio/xr819-xradio.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 7b78fc61d13a428a0d8a3d8dcffaa604d23b5a17c6e8e86d2e5e8372dcd17672 xr819-xradio-33f4b1c25eff0d9db7cbac19f36b130da9857f37.tar.gz
+sha256 2f61f2db78d46440819af2d8191f9b5ed2bb3e5404b739f68fb0af7917d0d222 xr819-xradio-aa01ba77b9360dd734b50f5b937960a50c5a0825.tar.gz
 # Locally computed
 sha256 db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73 LICENSE
diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
index edf423bc3c..ae3e4fbd34 100644
--- a/package/xr819-xradio/xr819-xradio.mk
+++ b/package/xr819-xradio/xr819-xradio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XR819_XRADIO_VERSION = 33f4b1c25eff0d9db7cbac19f36b130da9857f37
+XR819_XRADIO_VERSION = aa01ba77b9360dd734b50f5b937960a50c5a0825
 XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
 XR819_XRADIO_LICENSE = GPL-2.0
 XR819_XRADIO_LICENSE_FILES = LICENSE
-- 
2.23.0
