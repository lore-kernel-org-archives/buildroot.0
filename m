From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 09:54:00 +0100
Subject: [Buildroot] [git commit] package/libftdi: bump to version 0.20
Message-ID: <20150316091814.BF57580795@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ddeb91f4468b0fc2b412d3f51cda64ccb519f12b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add *.hash file.

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libftdi/libftdi.hash |    2 ++
 package/libftdi/libftdi.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/libftdi/libftdi.hash b/package/libftdi/libftdi.hash
new file mode 100644
index 0000000..5d9f876
--- /dev/null
+++ b/package/libftdi/libftdi.hash
@@ -0,0 +1,2 @@
+# Locally computed (after checking the signature from http://www.intra2net.com/en/developer/libftdi/download.php)
+sha256  3176d5b5986438f33f5208e690a8bfe90941be501cc0a72118ce3d338d4b838e  libftdi-0.20.tar.gz
diff --git a/package/libftdi/libftdi.mk b/package/libftdi/libftdi.mk
index 22d2616..8370b0a 100644
--- a/package/libftdi/libftdi.mk
+++ b/package/libftdi/libftdi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFTDI_VERSION = 0.19
+LIBFTDI_VERSION = 0.20
 LIBFTDI_SITE = http://www.intra2net.com/en/developer/libftdi/download
 LIBFTDI_DEPENDENCIES = libusb-compat libusb
 LIBFTDI_INSTALL_STAGING = YES
