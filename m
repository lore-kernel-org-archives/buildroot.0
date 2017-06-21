From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 21 Jun 2017 16:30:51 -0400
Subject: [Buildroot] [PATCH] strace: bump version to 4.17
In-Reply-To: <20170621203057.4346-1-aduskett@codeblue.com>
References: <20170621203057.4346-1-aduskett@codeblue.com>
Message-ID: <20170621203057.4346-2-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/strace/strace.hash | 6 +++---
 package/strace/strace.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index a0d4d2b..fbd9320 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,3 +1,3 @@
-# From https://sourceforge.net/projects/strace/files/strace/4.16/
-md5	2873366cac98770efcbed6e748d5ef23	strace-4.16.tar.xz
-sha1	b780a8cd2e60ea836cfd3468e0f81623a346d180	strace-4.16.tar.xz
+# From https://sourceforge.net/projects/strace/files/strace/4.17/
+md5	8d7eb10eba68bad83a269197e634b626	strace-4.17.tar.xz
+sha1	a60558a10757e41a39ee9e357d1d03d91d5d94d8	strace-4.17.tar.xz
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 008dc9f..119c9f5 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 4.16
+STRACE_VERSION = 4.17
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = http://downloads.sourceforge.net/project/strace/strace/$(STRACE_VERSION)
 STRACE_LICENSE = BSD-3-Clause
-- 
2.9.4
