From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Nov 2016 22:02:08 +0100
Subject: [Buildroot] [git commit branch/next] odroid-scripts: bump version
	to cfd289b1d69136b8bfd725d90cd648da4654f2bd
Message-ID: <20161125210221.E4DDB81E5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df6788e72be6e547cca067fa2da7d498ca3e4233
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- add support for new monitor modes.
- fix cvbs modes

Signed-off-by: Dagg Stompler <daggs@gmx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/odroid-scripts/odroid-scripts.hash | 2 +-
 package/odroid-scripts/odroid-scripts.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/odroid-scripts/odroid-scripts.hash b/package/odroid-scripts/odroid-scripts.hash
index 8fd4b2c..e5a262d 100644
--- a/package/odroid-scripts/odroid-scripts.hash
+++ b/package/odroid-scripts/odroid-scripts.hash
@@ -1,2 +1,2 @@
 #  Locally computed hash
-sha256 779e8beccf8c66d51e495a4cc0e6eccf72c295499a1ecdc0740aa4459de786a0 odroid-scripts-a252de04562dcf8d8a4918a544b45a9e3d46d2fb.tar.gz
+sha256 9d61472ee6aed2d1a7b5afdcb91b823003c8524a242572f24f89d4e57323daf3  odroid-scripts-cfd289b1d69136b8bfd725d90cd648da4654f2bd.tar.gz
diff --git a/package/odroid-scripts/odroid-scripts.mk b/package/odroid-scripts/odroid-scripts.mk
index 72e7b95..fc1940d 100644
--- a/package/odroid-scripts/odroid-scripts.mk
+++ b/package/odroid-scripts/odroid-scripts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ODROID_SCRIPTS_VERSION = a252de04562dcf8d8a4918a544b45a9e3d46d2fb
+ODROID_SCRIPTS_VERSION = cfd289b1d69136b8bfd725d90cd648da4654f2bd
 ODROID_SCRIPTS_SITE = $(call github,mdrjr,c2_bootini,$(ODROID_SCRIPTS_VERSION))
 ODROID_SCRIPTS_LICENSE = unclear
 
