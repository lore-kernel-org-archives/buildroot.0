From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue,  4 Apr 2017 19:50:13 -0300
Subject: [Buildroot] [PATCH 05/11] package: add missing empty line after
	header
In-Reply-To: <20170404225019.27916-1-ricardo.martincoski@gmail.com>
References: <20170404225019.27916-1-ricardo.martincoski@gmail.com>
Message-ID: <20170404225019.27916-5-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Occurrences were searched using [1]:
check-package --include-only PackageHeader $(find * -type f)
and manually fixed to comply to [2].

[1] http://patchwork.ozlabs.org/patch/729669/
[2] http://nightly.buildroot.org/#writing-rules-mk

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/grantlee/grantlee.mk | 1 +
 package/lesstif/lesstif.mk   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/grantlee/grantlee.mk b/package/grantlee/grantlee.mk
index 812603b82..575b63fef 100644
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
index 3d381fff8..933dd1337 100644
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
-- 
2.11.0
