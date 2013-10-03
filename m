From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Oct 2013 14:11:37 +0200
Subject: [Buildroot] [git commit] rsync: bump to version 3.1.0
Message-ID: <20131003200657.D5C519B933@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=755fe7997664a5d8b9e0188361ab78e780abb023
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsync/rsync.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 94c2e75..30748b5 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYNC_VERSION = 3.0.9
+RSYNC_VERSION = 3.1.0
 RSYNC_SOURCE = rsync-$(RSYNC_VERSION).tar.gz
 RSYNC_SITE = http://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPLv3+
