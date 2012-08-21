From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Aug 2012 12:59:49 +0200
Subject: [Buildroot] [git commit] rsync: add license info
Message-ID: <20120821110312.9D44097206@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9ca544dec71a1e1f80e370c08deaf8937d250fa5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rsync/rsync.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
 
