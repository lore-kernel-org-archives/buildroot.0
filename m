From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Thu, 15 Sep 2016 15:57:06 +0530
Subject: [Buildroot] [PATCH 5/7] audit: update legal info
In-Reply-To: <1473935228-14014-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1473935228-14014-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1473935228-14014-5-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Programs are released under GPLv2+. README file says libraries
libaudit.* and libauparse.* are released under LGPL but there are two
files auparse/strsplit.c and lib/strsplit.c which are released under
GPLv2+ which makes both libraries GPL. Until we review situation with
upstream, we don't add license for libraries.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/audit/audit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 7137208..1a203ce 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -6,7 +6,7 @@
 
 AUDIT_VERSION = 2.6.7
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
-AUDIT_LICENSE = GPLv2
+AUDIT_LICENSE = GPLv2+ (programs)
 AUDIT_LICENSE_FILES = COPYING
 
 AUDIT_INSTALL_STAGING = YES
-- 
2.6.2
