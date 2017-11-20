From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 20 Nov 2017 08:52:47 -0500
Subject: [Buildroot] [NEXT 1/1] audit: bump to 2.8.1
Message-ID: <20171120135247.2017-1-aduskett@gmail.com>
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
index 32cedc5..742f94a 100644
--- a/package/audit/audit.hash
+++ b/package/audit/audit.hash
@@ -1,4 +1,4 @@
 #Locally computed
-sha256 57b5ae5697f288b8e53286eacd1c6c2e88bd65db18df3d855332fc63b302fdae audit-2.7.8.tar.gz
+sha256 1becde92ff6e81798fa8878820ab2497d867036a6596f55109504b37c8b33b6c audit-2.8.1.tar.gz
 sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670 COPYING
 sha256 f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa COPYING.LIB
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 6c09477..8778e98 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUDIT_VERSION = 2.7.8
+AUDIT_VERSION = 2.8.1
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 AUDIT_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.13.6
