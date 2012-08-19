From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 19 Aug 2012 16:18:29 -0400
Subject: [Buildroot] [PATCH 7/8] rsync: add license info
In-Reply-To: <1345407510-10058-1-git-send-email-danomimanchego123@gmail.com>
References: <1345407510-10058-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1345407510-10058-7-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/rsync/rsync.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index f2df256..3963547 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -7,6 +7,8 @@
 RSYNC_VERSION = 3.0.9
 RSYNC_SOURCE = rsync-$(RSYNC_VERSION).tar.gz
 RSYNC_SITE = http://rsync.samba.org/ftp/rsync/src
+RSYNC_LICENSE = GPLv3+
+RSYNC_LICENSE_FILES = COPYING
 RSYNC_CONF_OPT = $(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
 RSYNC_CONF_OPT = --with-included-popt
 
-- 
1.7.9.5
