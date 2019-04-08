From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  8 Apr 2019 14:50:04 -0400
Subject: [Buildroot] [PATCH] package/audit: bump version to 2.8.5
Message-ID: <20190408185013.71465-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/audit/audit.hash | 2 +-
 package/audit/audit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/audit/audit.hash b/package/audit/audit.hash
index d8c11a3d19..71e7df7dbc 100644
--- a/package/audit/audit.hash
+++ b/package/audit/audit.hash
@@ -1,4 +1,4 @@
 #Locally computed
-sha256 a410694d09fc5708d980a61a5abcb9633a591364f1ecc7e97ad5daef9c898c38 audit-2.8.4.tar.gz
+sha256 0e5d4103646e00f8d1981e1cd2faea7a2ae28e854c31a803e907a383c5e2ecb7 audit-2.8.5.tar.gz
 sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670 COPYING
 sha256 f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa COPYING.LIB
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 0988f88d8d..31053fed99 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUDIT_VERSION = 2.8.4
+AUDIT_VERSION = 2.8.5
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 AUDIT_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.20.1
