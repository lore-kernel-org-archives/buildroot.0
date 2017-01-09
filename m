From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  9 Jan 2017 11:15:21 -0500
Subject: [Buildroot] [3/5] libsemanage: bump version to 2.6
In-Reply-To: <20170109161523.6855-1-aduskett@codeblue.com>
References: <20170109161523.6855-1-aduskett@codeblue.com>
Message-ID: <20170109161523.6855-3-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/libsemanage/libsemanage.hash | 2 +-
 package/libsemanage/libsemanage.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsemanage/libsemanage.hash b/package/libsemanage/libsemanage.hash
index 69f7c8d..62f4d83 100644
--- a/package/libsemanage/libsemanage.hash
+++ b/package/libsemanage/libsemanage.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 46e2f36254369b6e91d1eea0460c262b139361b055a3a67d3ceea2d8ef72e006 libsemanage-2.5.tar.gz
+sha256 4f81541047290b751f2ffb926fcd381c186f22db18d9fe671b0b4a6a54e8cfce libsemanage-2.6.tar.gz
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 005b822..7545594 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSEMANAGE_VERSION = 2.5
-LIBSEMANAGE_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20160223
+LIBSEMANAGE_VERSION = 2.6
+LIBSEMANAGE_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20161014
 LIBSEMANAGE_LICENSE = LGPLv2.1+
 LIBSEMANAGE_LICENSE_FILES = COPYING
 LIBSEMANAGE_DEPENDENCIES = host-bison host-flex audit libselinux ustr bzip2
-- 
2.9.3
