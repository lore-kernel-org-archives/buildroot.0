From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Thu, 11 Feb 2010 13:46:47 +0100
Subject: [Buildroot] [PATCH] Updates rsync source repository
Message-ID: <1265892407-11552-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>

rsync source repository has moved (?).
Bump version while we are at it.

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
---
 package/rsync/rsync.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 1ed6812..e1bb28e 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-RSYNC_VERSION:=3.0.6
+RSYNC_VERSION:=3.0.7
 RSYNC_SOURCE:=rsync-$(RSYNC_VERSION).tar.gz
-RSYNC_SITE:=http://rsync.samba.org/ftp/rsync
+RSYNC_SITE:=http://rsync.samba.org/ftp/rsync/src
 RSYNC_INSTALL_STAGING:=NO
 RSYNC_INSTALL_TARGET:=YES
 RSYNC_CONF_OPT=$(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
-- 
1.6.0.4
