From: Aleksander Morgado <aleksander@aleksander.es>
Date: Wed, 15 Jan 2020 10:51:59 +0100
Subject: [Buildroot] [PATCH] package/libqmi: bump to version 1.24.4
Message-ID: <20200115095159.27103-1-aleksander@aleksander.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://lists.freedesktop.org/archives/libqmi-devel/2020-January/003193.html

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
---
 package/libqmi/libqmi.hash | 2 +-
 package/libqmi/libqmi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index 6936fa6de9..ce96721153 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256	4ae4e476f960dbc0d04b1c0368776eb78edffd4421f3e4c074bb2bfb6375b282  libqmi-1.24.2.tar.xz
+sha256	0316badec92ff32f51fe6278e6046968d2272a26608995deedd8e4afb563918a  libqmi-1.24.4.tar.xz
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 51ddd2745f..7e89d4a1ae 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.24.2
+LIBQMI_VERSION = 1.24.4
 LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
-- 
2.24.1
