From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 7 Sep 2017 21:02:40 +0200
Subject: [Buildroot] [git commit] strace: bump to version 4.19
Message-ID: <20170907190433.A51AD7FC59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0bf15a829414109a51690a51cf88262b2e5856c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add license hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/strace/strace.hash | 10 +++++++---
 package/strace/strace.mk   |  2 +-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index b5c4c79..cd3ba1d 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,3 +1,7 @@
-# From https://sourceforge.net/projects/strace/files/strace/4.17/
-md5	3579b3266bb096cebaefbe2cdb1a3a78	strace-4.18.tar.xz
-sha1	ac2e6f746260dd71f6d22920d9ca8f4bfbe708a8	strace-4.18.tar.xz
+# From https://sourceforge.net/projects/strace/files/strace/4.19/
+md5	846a9a26e74e797f42d77a0348104072	strace-4.19.tar.xz
+sha1	43091b8a07c227a6ffafd6d0f9536917c9447011	strace-4.19.tar.xz
+# Locally calculated after checking signature
+# https://sourceforge.net/projects/strace/files/strace/4.19/strace-4.19.tar.xz.asc
+sha256	7c93ebc6c29280f47c24a0eb86873a99ccb2cac6512c60a60ba4ef99ab807281	strace-4.19.tar.xz
+sha256	ea7ff222f36c9df0aa2924a8f7c7d2aec3ea11e752feba4b15ec79b695b6236a	COPYING
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index c4c4523..dc36021 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 4.18
+STRACE_VERSION = 4.19
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = http://downloads.sourceforge.net/project/strace/strace/$(STRACE_VERSION)
 STRACE_LICENSE = BSD-3-Clause
