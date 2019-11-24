From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 24 Nov 2019 11:08:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/libftdi: add license
Message-ID: <20191124100846.24884-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libftdi/libftdi.hash | 5 +++++
 package/libftdi/libftdi.mk   | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/package/libftdi/libftdi.hash b/package/libftdi/libftdi.hash
index 5d9f8765db..8271ab277a 100644
--- a/package/libftdi/libftdi.hash
+++ b/package/libftdi/libftdi.hash
@@ -1,2 +1,7 @@
 # Locally computed (after checking the signature from http://www.intra2net.com/en/developer/libftdi/download.php)
 sha256  3176d5b5986438f33f5208e690a8bfe90941be501cc0a72118ce3d338d4b838e  libftdi-0.20.tar.gz
+
+# Hash for license files:
+sha256  6bd354f4b9beca001b1b5395be48cef1d749a3ed27dddb8114bf09eb0ab2d88c  LICENSE
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.GPL
+sha256  c340cbee4974bb96019e782f2279df016c92fb1e7f5299347e779d9acedbb991  COPYING.LIB
diff --git a/package/libftdi/libftdi.mk b/package/libftdi/libftdi.mk
index cdd77c2e68..90c100b061 100644
--- a/package/libftdi/libftdi.mk
+++ b/package/libftdi/libftdi.mk
@@ -6,6 +6,8 @@
 
 LIBFTDI_VERSION = 0.20
 LIBFTDI_SITE = http://www.intra2net.com/en/developer/libftdi/download
+LIBFTDI_LICENSE = LGPL-2.0 (libftdi), GPL-2.0 with exception (ftdipp)
+LIBFTDI_LICENSE_FILES = LICENSE COPYING.GPL COPYING.LIB
 LIBFTDI_DEPENDENCIES = libusb-compat libusb
 HOST_LIBFTDI_DEPENDENCIES = host-libusb-compat host-libusb
 LIBFTDI_INSTALL_STAGING = YES
-- 
2.24.0
