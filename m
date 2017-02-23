From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 23:15:39 +0100
Subject: [Buildroot] [git commit branch/next] gflags: bump to version v2.2.0
Message-ID: <20170223221603.28718803EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9190cb61fd15a3d92d84e473bd94146396a7dea2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gflags/gflags.hash | 2 +-
 package/gflags/gflags.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gflags/gflags.hash b/package/gflags/gflags.hash
index 5b22411..b9eeb57 100644
--- a/package/gflags/gflags.hash
+++ b/package/gflags/gflags.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	d8331bd0f7367c8afd5fcb5f5e85e96868a00fd24b7276fa5fcee1e5575c2662	gflags-v2.1.2.tar.gz
+sha256	466c36c6508a451734e4f4d76825cf9cd9b8716d2b70ef36479ae40f08271f88	gflags-v2.2.0.tar.gz
diff --git a/package/gflags/gflags.mk b/package/gflags/gflags.mk
index 89111ed..94f2210 100644
--- a/package/gflags/gflags.mk
+++ b/package/gflags/gflags.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GFLAGS_VERSION = v2.1.2
+GFLAGS_VERSION = v2.2.0
 GFLAGS_SITE = $(call github,gflags,gflags,$(GFLAGS_VERSION))
 GFLAGS_INSTALL_STAGING = YES
 GFLAGS_LICENSE = BSD-3c
