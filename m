From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jul 2014 11:29:12 +0200
Subject: [Buildroot] [git commit] rsync: bump to version 3.1.1
Message-ID: <20140710093732.DA0699D1F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d1047e915c14879fe273488c7ce7c3a37971100
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsync/rsync.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
