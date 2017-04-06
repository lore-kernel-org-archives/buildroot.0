From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 22:41:07 +0200
Subject: [Buildroot] [git commit] package: add missing empty line after
	header
Message-ID: <20170406204113.421C18274D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=250f27ac422ee67c40189666b6fd4c50dd41dd74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Occurrences were searched using [1]:
check-package --include-only PackageHeader $(find * -type f)
and manually fixed to comply to [2].

[1] http://patchwork.ozlabs.org/patch/729669/
[2] http://nightly.buildroot.org/#writing-rules-mk

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/grantlee/grantlee.mk | 1 +
 package/lesstif/lesstif.mk   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/grantlee/grantlee.mk b/package/grantlee/grantlee.mk
index 812603b..575b63f 100644
--- a/package/grantlee/grantlee.mk
+++ b/package/grantlee/grantlee.mk
@@ -3,6 +3,7 @@
 # grantlee
 #
 ################################################################################
+
 GRANTLEE_VERSION = 5.1.0
 GRANTLEE_SITE = http://downloads.grantlee.org
 GRANTLEE_INSTALL_STAGING = YES
diff --git a/package/lesstif/lesstif.mk b/package/lesstif/lesstif.mk
index 3d381ff..933dd13 100644
--- a/package/lesstif/lesstif.mk
+++ b/package/lesstif/lesstif.mk
@@ -3,6 +3,7 @@
 # lesstif
 #
 ################################################################################
+
 LESSTIF_VERSION = 0.95.2
 LESSTIF_SOURCE = lesstif-$(LESSTIF_VERSION).tar.bz2
 LESSTIF_SITE = http://downloads.sourceforge.net/project/lesstif/lesstif/$(LESSTIF_VERSION)
