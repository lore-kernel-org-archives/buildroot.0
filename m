From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Jul 2014 16:03:42 -0300
Subject: [Buildroot] [PATCH] rsync: bump to version 3.1.1
Message-ID: <1404932622-5471-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rsync/rsync.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index d0ceaa9..7855595 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYNC_VERSION = 3.1.0
+RSYNC_VERSION = 3.1.1
 RSYNC_SITE = http://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPLv3+
 RSYNC_LICENSE_FILES = COPYING
-- 
1.8.5.5
