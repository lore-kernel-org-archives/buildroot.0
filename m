From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jul 2020 17:12:45 +0200
Subject: [Buildroot] [git commit] package/policycoreutils: bump to 20200710
Message-ID: <20200715151043.5B505818F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2629220d80ab3d8da009eb51268d81b63d8e549
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/policycoreutils/policycoreutils.hash | 2 +-
 package/policycoreutils/policycoreutils.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/policycoreutils/policycoreutils.hash b/package/policycoreutils/policycoreutils.hash
index 206d2e35a7..5dae18f17d 100644
--- a/package/policycoreutils/policycoreutils.hash
+++ b/package/policycoreutils/policycoreutils.hash
@@ -1,3 +1,3 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 3379c9bd722e36be9bf8856c6fa373bfa9b33305ac9da5fc807cfe7fa605f489 policycoreutils-3.0.tar.gz
+sha256 c889f62ee80f8b6a369469a9b8af51f5b797975aeaa291f5c5960cc12eed1934 policycoreutils-3.1.tar.gz
 sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index a06c7847ab..4c0fdc71a7 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-POLICYCOREUTILS_VERSION = 3.0
-POLICYCOREUTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/20191204
+POLICYCOREUTILS_VERSION = 3.1
+POLICYCOREUTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/20200710
 POLICYCOREUTILS_LICENSE = GPL-2.0
 POLICYCOREUTILS_LICENSE_FILES = COPYING
 
