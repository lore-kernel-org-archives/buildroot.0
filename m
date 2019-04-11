From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Apr 2019 14:23:16 +0200
Subject: [Buildroot] [git commit] package/libsemanage: bump to version 2.9
Message-ID: <20190411121929.B69AB8E15A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2eb0529ee1f50417e3dd154a571006c48acd40ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
