From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 22:31:53 +0200
Subject: [Buildroot] [git commit] package/policycoreutils: bump version to
 3.0
Message-ID: <20200417203421.8E57B8F030@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0828ce360ab6327c1c0d5e99cd287631b9adc5a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
