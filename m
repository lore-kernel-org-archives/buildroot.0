From: Adam Duskett <aduskett@gmail.com>
Date: Thu,  1 Feb 2018 09:32:48 -0500
Subject: [Buildroot] [PATCH 1/1] audit: bump to 2.8.2
Message-ID: <20180201143248.21255-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/audit/audit.hash | 2 +-
 package/audit/audit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/audit/audit.hash b/package/audit/audit.hash
index 742f94ae42..fb37577782 100644
--- a/package/audit/audit.hash
+++ b/package/audit/audit.hash
@@ -1,4 +1,4 @@
 #Locally computed
-sha256 1becde92ff6e81798fa8878820ab2497d867036a6596f55109504b37c8b33b6c audit-2.8.1.tar.gz
+sha256 67b59b2b77afee9ed87afa4d80ffc8e6f3a1f4bbedd5f2871f387c952147bcba audit-2.8.2.tar.gz
 sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670 COPYING
 sha256 f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa COPYING.LIB
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 8778e9845c..f5aa00d2f0 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUDIT_VERSION = 2.8.1
+AUDIT_VERSION = 2.8.2
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 AUDIT_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.14.3
