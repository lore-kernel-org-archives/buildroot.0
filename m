From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Dec 2016 21:27:56 +0100
Subject: [Buildroot] [git commit] strace: bump to version 4.15
Message-ID: <20161218203346.6099081963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32ba7b7b15677829d705947302253de114f17620
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/strace/strace.hash | 5 +++--
 package/strace/strace.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 383a266..c7695ff 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,2 +1,3 @@
-# Locally computed
-sha256	5bed5110b243dce6864bedba269446c18c8c63f553cdd7fd4f808d89a764712f	strace-4.14.tar.xz
+# From https://sourceforge.net/projects/strace/files/strace/4.15/
+md5	1ff96209fec19914c920608ed0791864	strace-4.15.tar.xz
+sha1	18fbaeb07d089023764f618f179091b663a0d21e	strace-4.15.tar.xz
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 59418af..b8de81a 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 4.14
+STRACE_VERSION = 4.15
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = http://downloads.sourceforge.net/project/strace/strace/$(STRACE_VERSION)
 STRACE_LICENSE = BSD-3c
