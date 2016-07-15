From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 15 Jul 2016 11:43:18 -0400
Subject: [Buildroot] [PATCH 1/1] package/audit: Bump to version 2.6.5
Message-ID: <1468597398-25655-1-git-send-email-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/audit/audit.hash | 2 +-
 package/audit/audit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/audit/audit.hash b/package/audit/audit.hash
index 8d6649b..75b0197 100644
--- a/package/audit/audit.hash
+++ b/package/audit/audit.hash
@@ -1,2 +1,2 @@
 #Locally computed
-sha256	016a101d6f8f5608ff90355b49adeb2848990ab2fdbb0933c3e09ac8c95db1d9	audit-2.6.3.tar.gz
+sha256	a9c4bc0b95ffabc364f7de67ea694bab7045b120f396a2b149399a17138592bf	audit-2.6.5.tar.gz
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 4cc87d1..89fdf14 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUDIT_VERSION = 2.6.3
+AUDIT_VERSION = 2.6.5
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPLv2
 AUDIT_LICENSE_FILES = COPYING
-- 
2.7.4
