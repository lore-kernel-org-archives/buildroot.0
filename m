From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 27 Sep 2011 12:17:43 +0200
Subject: [Buildroot] [PATCH] rsync: bump to 3.0.9
Message-ID: <4E81A2C7.6000206@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/rsync/rsync.mk |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

Index: b/package/rsync/rsync.mk
===================================================================
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,10 +4,9 @@
 #
 #############################################################
 
-RSYNC_VERSION := 3.0.8
-RSYNC_SOURCE := rsync-$(RSYNC_VERSION).tar.gz
-RSYNC_SITE := http://rsync.samba.org/ftp/rsync/src
-RSYNC_INSTALL_STAGING = NO
+RSYNC_VERSION = 3.0.9
+RSYNC_SOURCE = rsync-$(RSYNC_VERSION).tar.gz
+RSYNC_SITE = http://rsync.samba.org/ftp/rsync/src
 RSYNC_CONF_OPT = $(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
 RSYNC_CONF_OPT = --with-included-popt
 
