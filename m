From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 24 Jun 2016 20:21:08 -0400
Subject: [Buildroot] [PATCH 3/8 v3] audit: bump to version 2.5.2
In-Reply-To: <1466814074-4557-1-git-send-email-Aduskett@gmail.com>
References: <1466814074-4557-1-git-send-email-Aduskett@gmail.com>
Message-ID: <1466814074-4557-2-git-send-email-Aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated to version 2.5.2.

Changes v2 -> v3:
 - Split patch into two patches.  One for a version bump, the second for
 the ability to build as a host package.

Changes v1 -> v2:
 - Version bump and the ability to build as a host package as a
 single patch.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/audit/audit.hash | 2 +-
 package/audit/audit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/audit/audit.hash b/package/audit/audit.hash
index f234fdb..a8b2812 100644
--- a/package/audit/audit.hash
+++ b/package/audit/audit.hash
@@ -1,2 +1,2 @@
 #Locally computed
-sha256	25f57f465f3230d7b1166b615ffd6748818a3dc225d0e8b396c5b2e951674e23	audit-2.4.4.tar.gz
+sha256	f7c35a8c27d98255303f0e828d1045df43f968957bc733338335c64f2ede024d	audit-2.5.2.tar.gz
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 1fbc623..9589c06 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUDIT_VERSION = 2.4.4
+AUDIT_VERSION = 2.5.2
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPLv2
 AUDIT_LICENSE_FILES = COPYING
-- 
2.7.4
