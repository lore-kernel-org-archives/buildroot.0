From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 18 Dec 2016 10:43:05 -0300
Subject: [Buildroot] [PATCH] strace: bump to version 4.15
Message-ID: <20161218134305.6639-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
2.10.2
