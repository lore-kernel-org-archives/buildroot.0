From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 24 Apr 2019 17:03:26 -0400
Subject: [Buildroot] [PATCH v3 03/10] package/libvpx: bump to version v1.8.0
In-Reply-To: <20190424210333.62571-1-aduskett@gmail.com>
References: <20190424210333.62571-1-aduskett@gmail.com>
Message-ID: <20190424210333.62571-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

The gst1-plugins-good 1.16.0 vpx plugin requires libvpx v1.8.0

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v2:
  - Added this patch to the series.

 package/libvpx/libvpx.hash | 2 +-
 package/libvpx/libvpx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvpx/libvpx.hash b/package/libvpx/libvpx.hash
index 1397b62f7b..bcf643b073 100644
--- a/package/libvpx/libvpx.hash
+++ b/package/libvpx/libvpx.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256 1fec931eb5c94279ad219a5b6e0202358e94a93a90cfb1603578c326abfc1238  libvpx-v1.7.0.tar.gz
+sha256 86df18c694e1c06cc8f83d2d816e9270747a0ce6abe316e93a4f4095689373f6  libvpx-v1.8.0.tar.gz
 sha256 8267348d5af1262c11d1a08de2f5afc77457755f1ac658627dd9acf71011d615  LICENSE
 sha256 cc3273e0694ea5896145e0677699b53471b03ea43021ddc50e7923fbb9f5023c  PATENTS
diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
index 0f867eb2a9..265fcee1cf 100644
--- a/package/libvpx/libvpx.mk
+++ b/package/libvpx/libvpx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVPX_VERSION = v1.7.0
+LIBVPX_VERSION = v1.8.0
 LIBVPX_SITE = $(call github,webmproject,libvpx,$(LIBVPX_VERSION))
 LIBVPX_LICENSE = BSD-3-Clause
 LIBVPX_LICENSE_FILES = LICENSE PATENTS
-- 
2.20.1
