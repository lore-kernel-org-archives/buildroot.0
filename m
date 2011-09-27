From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Sep 2011 20:52:12 +0200
Subject: [Buildroot] [git commit] rsync: bump to 3.0.9
Message-ID: <20110927212737.2E4CD8D9FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a775837fb869ff6ac0996a08b8a3c9ead8fdbf0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rsync/rsync.mk |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 5030fae..e99b650 100644
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
 
