From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 22:19:48 +0200
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.98
Message-ID: <20190424203248.717F681474@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc2d15a463d9b16c7babb0a03063b272a1a4dff6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For detail see [1].

[1] https://lists.freedesktop.org/archives/dri-devel/2019-April/215254.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libdrm/libdrm.hash | 10 +++++-----
 package/libdrm/libdrm.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 301866c8b0..cd08a9505a 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2019-January/204447.html
-md5 acef22d0c62c89692348c2dd5591393e  libdrm-2.4.97.tar.bz2
-sha1 7635bec769a17edd140282fa2c46838c4a44bc91  libdrm-2.4.97.tar.bz2
-sha256 77d0ccda3e10d6593398edb70b1566bfe1a23a39bd3da98ace2147692eadd123  libdrm-2.4.97.tar.bz2
-sha512 3e08ee9d6c9ce265d783a59b51e22449905ea73aa27f25a082a1e9e1532f7c99e1c9f7cb966eb0970be2a08e2e5993dc9aa55093b1bff548689fdb465e7145ed  libdrm-2.4.97.tar.bz2
+# From https://lists.freedesktop.org/archives/dri-devel/2019-April/215254.html
+md5 1320b43c4bdb8846c308ec2610b62b64 libdrm-2.4.98.tar.bz2
+sha1 4c8a11870a89f59c294bef0109939a7ffaa1fb26 libdrm-2.4.98.tar.bz2
+sha256 8be0edccaca3abde8b6bb1431b46354c7fab46e9b91cc6946ba65b51f56f1894 libdrm-2.4.98.tar.bz2
+sha512 3d333d060ceb14fa8e204ef468ca2c95d6f07205185ca90a044b685832b9b2d7256faa5e81d5871ce8b70aa1fdf9fb1ade18b4e582ff0c7ef5551da8506eb27b libdrm-2.4.98.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index cc7350c10e..91d109c678 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.97
+LIBDRM_VERSION = 2.4.98
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
