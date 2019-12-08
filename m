From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun,  8 Dec 2019 12:19:28 -0800
Subject: [Buildroot] [PATCH 06/11] libsemanage: bump version to 3.0
In-Reply-To: <20191208201933.3832327-1-aduskett@gmail.com>
References: <20191208201933.3832327-1-aduskett@gmail.com>
Message-ID: <20191208201933.3832327-6-aduskett@gmail.com>
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
index 871ed192c4..85dafeb44d 100644
--- a/package/libsemanage/libsemanage.hash
+++ b/package/libsemanage/libsemanage.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 2576349d344492e73b468059767268dec1dabd8c35f3c7222c3ec2448737bc1c libsemanage-2.9.tar.gz
+sha256 a497b0720d54eac427f1f3f618eed417e50ed8f4e47ed0f7a1d391bd416e84cf libsemanage-3.0.tar.gz
 
 # Hash for license file
 sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index fd90346049..407c66b9cb 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSEMANAGE_VERSION = 2.9
-LIBSEMANAGE_SITE = https://github.com/SELinuxProject/selinux/releases/download/20190315
+LIBSEMANAGE_VERSION = 3.0
+LIBSEMANAGE_SITE = https://github.com/SELinuxProject/selinux/releases/download/20191204
 LIBSEMANAGE_LICENSE = LGPL-2.1+
 LIBSEMANAGE_LICENSE_FILES = COPYING
 LIBSEMANAGE_DEPENDENCIES = host-bison host-flex audit libselinux bzip2
-- 
2.23.0
