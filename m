From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  8 Apr 2019 14:50:07 -0400
Subject: [Buildroot] [PATCH] libsemanage: bump to version 2.9
In-Reply-To: <20190408185013.71465-1-aduskett@gmail.com>
References: <20190408185013.71465-1-aduskett@gmail.com>
Message-ID: <20190408185013.71465-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libsemanage/libsemanage.hash | 2 +-
 package/libsemanage/libsemanage.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsemanage/libsemanage.hash b/package/libsemanage/libsemanage.hash
index 5315514003..871ed192c4 100644
--- a/package/libsemanage/libsemanage.hash
+++ b/package/libsemanage/libsemanage.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 1c0de8d2c51e5460926c21e371105c84a39087dfd8f8e9f0cc1d017e4cbea8e2 libsemanage-2.8.tar.gz
+sha256 2576349d344492e73b468059767268dec1dabd8c35f3c7222c3ec2448737bc1c libsemanage-2.9.tar.gz
 
 # Hash for license file
 sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index bbde50f49f..a139ad0a68 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSEMANAGE_VERSION = 2.8
-LIBSEMANAGE_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20180524
+LIBSEMANAGE_VERSION = 2.9
+LIBSEMANAGE_SITE = https://github.com/SELinuxProject/selinux/releases/download/20190315
 LIBSEMANAGE_LICENSE = LGPL-2.1+
 LIBSEMANAGE_LICENSE_FILES = COPYING
 LIBSEMANAGE_DEPENDENCIES = host-bison host-flex audit libselinux ustr bzip2
-- 
2.20.1
