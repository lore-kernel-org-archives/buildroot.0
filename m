From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 15 Jan 2020 22:00:37 +0100
Subject: [Buildroot] [PATCH v2 3/3] package/rpi-userland: bump version to
 06bc6da
In-Reply-To: <20200115210037.9564-1-ps.report@gmx.net>
References: <20200115210037.9564-1-ps.report@gmx.net>
Message-ID: <20200115210037.9564-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 - > v2:
  - bump to 06bc6da (instead of 42ec119), now contains
    previous patch extra upstream patch
    0006-Fix-for-cmake-vmcs_host-error-fixes-603.patch
---
 package/rpi-userland/rpi-userland.hash | 2 +-
 package/rpi-userland/rpi-userland.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
index 6d59f2aafc..b6d9b99b3c 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 d6231e9fa33c805cf7cbb559a0d6eb125605fc2ba862d9e5a3248778dd269859 rpi-userland-5070cb7fc150fc98f1ed64a7739c3356970d9f76.tar.gz
+sha256 cf4dff40a2f4ec38bc7e42a80b989df1bf88e12d714f7e681f83c4e5a588f5c9 rpi-userland-06bc6daa02137ca72b7a2104afad81e82a44de17.tar.gz
 sha256 bee6f1249175683d8610651706e1aa7dffcbfd3f9c4c05bc1e5ab34f313c2db5 LICENCE
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 2b672b6c97..7dd29e88e7 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 5070cb7fc150fc98f1ed64a7739c3356970d9f76
+RPI_USERLAND_VERSION = 06bc6daa02137ca72b7a2104afad81e82a44de17
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3-Clause
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
2.24.1
