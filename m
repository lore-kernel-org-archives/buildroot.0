From: Arn R <arnerro@gmail.com>
Date: Fri, 24 May 2013 00:29:13 +1000
Subject: [Buildroot] [PATCH 1/1] logrotate: Bump version to 3.8.4
Message-ID: <1369319353-5915-1-git-send-email-arnerro@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The changelog for logrotate indicates some CVE's were fixed in 3.8.0.
(changelog at http://svn.fedorahosted.org/svn/logrotate/tags/r3-8-4/CHANGES)

Signed-off-by: Arn R <arnerro@gmail.com>
---
 package/logrotate/logrotate.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index da8e4b3..c920b46 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -3,7 +3,7 @@
 # logrotate
 #
 #############################################################
-LOGROTATE_VERSION = 3.7.9
+LOGROTATE_VERSION = 3.8.4
 LOGROTATE_SOURCE = logrotate-$(LOGROTATE_VERSION).tar.gz
 LOGROTATE_SITE = https://fedorahosted.org/releases/l/o/logrotate/
 LOGROTATE_LICENSE = GPLv2+
-- 
1.8.1.2
