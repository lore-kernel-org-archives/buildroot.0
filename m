From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 25 Jan 2015 22:13:50 +0100
Subject: [Buildroot] [PATCH 3/8] package/libftdi: bump to version 0.20
In-Reply-To: <1422220435-18689-1-git-send-email-s.martin49@gmail.com>
References: <1422220435-18689-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1422220435-18689-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add *.hash file.

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/libftdi/libftdi.hash | 2 ++
 package/libftdi/libftdi.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/libftdi/libftdi.hash

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
-- 
2.2.2
