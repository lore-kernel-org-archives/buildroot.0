From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Oct 2017 15:55:18 +0200
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.84
Message-ID: <20171015134948.BDAEB7FA3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2569e3f6f1cd9cc7795db11016bbc70754eef15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changed _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdrm/libdrm.hash | 10 +++++-----
 package/libdrm/libdrm.mk   |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 704bf1b..be24658 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2017-August/151077.html
-md5 23800953ed7564988872e1e8c61fde31  libdrm-2.4.83.tar.bz2
-sha1 f78d392684d6e482e8c0a85d355619ac64c4ad6a  libdrm-2.4.83.tar.bz2
-sha256 03a52669da60ead62548a35bc430aafb6c2d8dd21ec9dba3a90f96eff5fe36d6  libdrm-2.4.83.tar.bz2
-sha512 8f894ff61939bca03ac857506a84bbbcbe2367e60c91a0f2388bfce5ae81e12ba2f96fe1c962416cf9e2d25ef04b98b5437c7015497789561311a72607b3bfcb  libdrm-2.4.83.tar.bz2
+# From https://lists.freedesktop.org/archives/dri-devel/2017-October/154645.html
+md5 35b9544bc2ad864acd1abaa1a2b99092  libdrm-2.4.84.tar.bz2
+sha1 3a8835aaef89648757593f00008de9eff95990dd  libdrm-2.4.84.tar.bz2
+sha256 7ae9c24d91139ac9a2cdee06fe46dbe1c401a1eda1c0bd2a6d1ecf72f479e0aa  libdrm-2.4.84.tar.bz2
+sha512 860ebc5fa934edee97e9e7e13aaa2f2e70a68b946f4f3893cd7f93b8296c10b3cd4ce4c23b1676eefe375286e6e2292b96e917d7976f65c61da3fa661e5e641a  libdrm-2.4.84.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index e4d3e39..da100b8 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.83
+LIBDRM_VERSION = 2.4.84
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
-LIBDRM_SITE = http://dri.freedesktop.org/libdrm
+LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
 LIBDRM_INSTALL_STAGING = YES
 LIBDRM_DEPENDENCIES = \
