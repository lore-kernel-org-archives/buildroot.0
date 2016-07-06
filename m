From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 21:22:15 +0200
Subject: [Buildroot] [git commit] audit: bump to version 2.6.3
Message-ID: <20160706192226.02BFF8222E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00025c2686b1265e4f1ad0702f98655e90722114
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/audit/audit.hash | 2 +-
 package/audit/audit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/audit/audit.hash b/package/audit/audit.hash
index 62cd186..8d6649b 100644
--- a/package/audit/audit.hash
+++ b/package/audit/audit.hash
@@ -1,2 +1,2 @@
 #Locally computed
-sha256	e04662a44466e4fd115dd91e0948154b3b002c325f2c0765ddfef6da0c8b65f1	audit-2.6.2.tar.gz
+sha256	016a101d6f8f5608ff90355b49adeb2848990ab2fdbb0933c3e09ac8c95db1d9	audit-2.6.3.tar.gz
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 849b68a..4cc87d1 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUDIT_VERSION = 2.6.2
+AUDIT_VERSION = 2.6.3
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPLv2
 AUDIT_LICENSE_FILES = COPYING
