From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 13 Oct 2017 14:25:28 -0400
Subject: [Buildroot] [PATCH v7 2/5] libsemanage: bump to 2.7
In-Reply-To: <20171013182531.22220-1-aduskett@gmail.com>
References: <20171013182531.22220-1-aduskett@gmail.com>
Message-ID: <20171013182531.22220-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - None

Changes v2 -> v3:
  - None

Changes v3 -> v4:
  - None

Changes v4 -> v5:
  - None

Changes v5 -> v6:
  - None

Changes v6 -> v7:
  - None

 package/libsemanage/libsemanage.hash | 4 ++--
 package/libsemanage/libsemanage.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libsemanage/libsemanage.hash b/package/libsemanage/libsemanage.hash
index 62f4d833a5..c386571591 100644
--- a/package/libsemanage/libsemanage.hash
+++ b/package/libsemanage/libsemanage.hash
@@ -1,2 +1,2 @@
-# Locally computed
-sha256 4f81541047290b751f2ffb926fcd381c186f22db18d9fe671b0b4a6a54e8cfce libsemanage-2.6.tar.gz
+# From: https://github.com/SELinuxProject/selinux/wiki/Releases
+sha256 07e9477714ce6a4557a1fe924ea4cb06501b62d0fa0e3c0dc32a2cf47cb8d476 libsemanage-2.7.tar.gz
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 2964c56f96..829409f527 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSEMANAGE_VERSION = 2.6
-LIBSEMANAGE_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20161014
+LIBSEMANAGE_VERSION = 2.7
+LIBSEMANAGE_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804
 LIBSEMANAGE_LICENSE = LGPL-2.1+
 LIBSEMANAGE_LICENSE_FILES = COPYING
 LIBSEMANAGE_DEPENDENCIES = host-bison host-flex audit libselinux ustr bzip2
-- 
2.13.6
