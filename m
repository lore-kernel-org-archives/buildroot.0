From: Axel Lin <axel.lin@ingics.com>
Date: Sun, 22 Dec 2013 16:36:09 +0800
Subject: [Buildroot] [PATCH] subversion: bump to version 1.7.14
Message-ID: <1387701369.19488.3.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upgrade to latest security-related bugfixes release.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/subversion/subversion.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/subversion/subversion.mk b/package/subversion/subversion.mk
index de4db7c..6eb3218 100644
--- a/package/subversion/subversion.mk
+++ b/package/subversion/subversion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUBVERSION_VERSION = 1.7.9
+SUBVERSION_VERSION = 1.7.14
 SUBVERSION_SITE = http://archive.apache.org/dist/subversion
 SUBVERSION_LICENSE = Apache 2.0
 SUBVERSION_LICENSE_FILES = LICENSE
-- 
1.8.1.2
