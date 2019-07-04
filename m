From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  4 Jul 2019 07:52:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.99
Message-ID: <20190704055231.16105-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdrm/libdrm.hash | 10 +++++-----
 package/libdrm/libdrm.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index cd08a9505a..a2b68b50e1 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2019-April/215254.html
-md5 1320b43c4bdb8846c308ec2610b62b64 libdrm-2.4.98.tar.bz2
-sha1 4c8a11870a89f59c294bef0109939a7ffaa1fb26 libdrm-2.4.98.tar.bz2
-sha256 8be0edccaca3abde8b6bb1431b46354c7fab46e9b91cc6946ba65b51f56f1894 libdrm-2.4.98.tar.bz2
-sha512 3d333d060ceb14fa8e204ef468ca2c95d6f07205185ca90a044b685832b9b2d7256faa5e81d5871ce8b70aa1fdf9fb1ade18b4e582ff0c7ef5551da8506eb27b libdrm-2.4.98.tar.bz2
+# From https://lists.freedesktop.org/archives/dri-devel/2019-July/225069.html
+md5 72539626815b35159a63d45bc4c14ee6  libdrm-2.4.99.tar.bz2
+sha1 e15a3fcc2d321b03d233a245a8593abde7feefd4  libdrm-2.4.99.tar.bz2
+sha256 4dbf539c7ed25dbb2055090b77ab87508fc46be39a9379d15fed4b5517e1da5e  libdrm-2.4.99.tar.bz2
+sha512 04702eebe8dca97fac61653623804fdcb0b8b3714bdc6f5e72f0dfdce9c9524cf16f69d37aa9feac79ddc1c11939be44a216484563a612414668ea5eaeadf191  libdrm-2.4.99.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 91d109c678..f6955826d3 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.98
+LIBDRM_VERSION = 2.4.99
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.20.1
