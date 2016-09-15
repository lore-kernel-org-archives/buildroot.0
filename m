From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Thu, 15 Sep 2016 15:57:05 +0530
Subject: [Buildroot] [PATCH 4/7] audit: bump version to 2.6.7
In-Reply-To: <1473935228-14014-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1473935228-14014-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1473935228-14014-4-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/audit/audit.hash | 2 +-
 package/audit/audit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/audit/audit.hash b/package/audit/audit.hash
index 2ce381f..794a93a 100644
--- a/package/audit/audit.hash
+++ b/package/audit/audit.hash
@@ -1,2 +1,2 @@
 #Locally computed
-sha256	d99339a63fc6efaaee89efe7fa0e0c395f661392a4ae5056b2c9d10c67ca63a1	audit-2.6.5.tar.gz
+sha256 8923917332daa7833bbc0c1d9eb012167093fbad000da4a9630fb3356aff8cdc audit-2.6.7.tar.gz
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 11ee8df..7137208 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUDIT_VERSION = 2.6.5
+AUDIT_VERSION = 2.6.7
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPLv2
 AUDIT_LICENSE_FILES = COPYING
-- 
2.6.2
