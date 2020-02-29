From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 29 Feb 2020 15:28:26 -0800
Subject: [Buildroot] [PATCH/next 1/3] package/openrc: bump to version 0.42.1
Message-ID: <20200229232829.4177324-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/openrc/openrc.hash | 2 +-
 package/openrc/openrc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openrc/openrc.hash b/package/openrc/openrc.hash
index 7d58e254c4..bb5880806d 100644
--- a/package/openrc/openrc.hash
+++ b/package/openrc/openrc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	c99488ca54f2b795328d07bbd456ade49b571136bba7501f7eaaeb1ca9f9ecc4	openrc-0.41.2.tar.gz
+sha256	91a01ca6d930a0688fb91338209985de57cac7aa2d37feddacb78fd3d95308e2	openrc-0.42.1.tar.gz
 sha256	96862463f4e77e2508e4fc2c83773fd24807cb699368b63fd93a5e2b466dd624	LICENSE
diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 3f6453cef5..b1b3ed2c56 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENRC_VERSION = 0.41.2
+OPENRC_VERSION = 0.42.1
 OPENRC_SITE = $(call github,OpenRC,openrc,$(OPENRC_VERSION))
 OPENRC_LICENSE = BSD-2-Clause
 OPENRC_LICENSE_FILES = LICENSE
-- 
2.24.1
