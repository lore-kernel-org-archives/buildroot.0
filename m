From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 21:18:18 +0100
Subject: [Buildroot] [git commit branch/next] strace: bump to version 4.16
Message-ID: <20170215201837.F36BB7FFE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24576234c52e26e7f47fbf8ce969e3f4f62399f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/strace/strace.hash | 6 +++---
 package/strace/strace.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index c7695ff..a0d4d2b 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,3 +1,3 @@
-# From https://sourceforge.net/projects/strace/files/strace/4.15/
-md5	1ff96209fec19914c920608ed0791864	strace-4.15.tar.xz
-sha1	18fbaeb07d089023764f618f179091b663a0d21e	strace-4.15.tar.xz
+# From https://sourceforge.net/projects/strace/files/strace/4.16/
+md5	2873366cac98770efcbed6e748d5ef23	strace-4.16.tar.xz
+sha1	b780a8cd2e60ea836cfd3468e0f81623a346d180	strace-4.16.tar.xz
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index b8de81a..15a0fbf 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 4.15
+STRACE_VERSION = 4.16
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = http://downloads.sourceforge.net/project/strace/strace/$(STRACE_VERSION)
 STRACE_LICENSE = BSD-3c
