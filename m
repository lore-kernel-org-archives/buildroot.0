From: Adam Duskett <aduskett@gmail.com>
Date: Tue,  4 Feb 2020 02:33:19 -0800
Subject: [Buildroot] [PATCH v2 4/7] package/policycoreutils: bump version to
 3.0
In-Reply-To: <20200204103322.428413-1-aduskett@gmail.com>
References: <20200204103322.428413-1-aduskett@gmail.com>
Message-ID: <20200204103322.428413-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/policycoreutils/policycoreutils.hash | 2 +-
 package/policycoreutils/policycoreutils.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/policycoreutils/policycoreutils.hash b/package/policycoreutils/policycoreutils.hash
index c601c7818b..206d2e35a7 100644
--- a/package/policycoreutils/policycoreutils.hash
+++ b/package/policycoreutils/policycoreutils.hash
@@ -1,3 +1,3 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 c53c344f28007b3c0742bd958751e9b5d2385898adeb8aec6281ae57342f0f7b policycoreutils-2.9.tar.gz
+sha256 3379c9bd722e36be9bf8856c6fa373bfa9b33305ac9da5fc807cfe7fa605f489 policycoreutils-3.0.tar.gz
 sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index 6cd5a019c5..a06c7847ab 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-POLICYCOREUTILS_VERSION = 2.9
-POLICYCOREUTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/20190315
+POLICYCOREUTILS_VERSION = 3.0
+POLICYCOREUTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/20191204
 POLICYCOREUTILS_LICENSE = GPL-2.0
 POLICYCOREUTILS_LICENSE_FILES = COPYING
 
-- 
2.24.1
