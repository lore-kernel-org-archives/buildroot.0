Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680F1C0015E
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 13:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F388860681;
	Sat, 12 Aug 2023 13:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F388860681
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jTkBWJ7UxnYA; Sat, 12 Aug 2023 13:06:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2C1260736;
	Sat, 12 Aug 2023 13:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2C1260736
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 674081BF3D6
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 13:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40CCF81C40
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 13:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40CCF81C40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mnFs7B1xmLXC for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 13:06:28 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F282E81C38
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 13:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F282E81C38
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 3E5403520C44; Sat, 12 Aug 2023 15:06:26 +0200 (CEST)
Date: Sat, 12 Aug 2023 15:06:26 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNeD0iRhXWHTZHLX@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691845586; bh=LlT6e0348/2A87t9O3sp++CCfSscEivQpuCiXVQQzRU=;
 h=Date:From:To:Subject:From;
 b=sQd6GzDeCWJnrP4oPvr6PSgBHEGHICF+cdvl4BuMhczLS4TIy9vdJvm3ql3FVG6nt
 mpkFrqzURXvnN6oG5KpcjXm/U07EUFG0i5nNHBtRbV+JMZP7LNaoc8Yykqi19mhbYR
 7TG3r1kpW4rOBaLwbk95I6G7U/WODP2U2ff1YgBPR34Fgk71bB4pEKO/U1sSkE50tY
 BQdZpEO/33ysuLKY3K+pBnms7lisIq0Ym9jNzL1gMbNiyv4Yd1jT2NAvDbckYOqQT8
 TRGuYRTVqacnq/Q1SsXtybAUWmdgl3fWhD15cC1z6IOoIWe1zV/rAicnfIC5dufbwk
 stkw2Hvbg0qXg==
Subject: [Buildroot] [PATCH v2 2/2] package/xfsprogs: bump version to 6.4.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Patch 0003-libxfs-stop-overriding-MAP_SYNC-in-publicly-exported.patch is upstreamed.

See here for changes to the previous version:
https://fossies.org/linux/xfsprogs/doc/CHANGES

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1 -> v2:
  - no change
---
 ...riding-MAP_SYNC-in-publicly-exported.patch | 187 ------------------
 package/xfsprogs/xfsprogs.hash                |   2 +-
 package/xfsprogs/xfsprogs.mk                  |   2 +-
 3 files changed, 2 insertions(+), 189 deletions(-)
 delete mode 100644 package/xfsprogs/0003-libxfs-stop-overriding-MAP_SYNC-in-publicly-exported.patch

diff --git a/package/xfsprogs/0003-libxfs-stop-overriding-MAP_SYNC-in-publicly-exported.patch b/package/xfsprogs/0003-libxfs-stop-overriding-MAP_SYNC-in-publicly-exported.patch
deleted file mode 100644
index 510ed5b642..0000000000
--- a/package/xfsprogs/0003-libxfs-stop-overriding-MAP_SYNC-in-publicly-exported.patch
+++ /dev/null
@@ -1,187 +0,0 @@
-From b82bd75c80aadcc2890b23f63eec9ba2c560b2e5 Mon Sep 17 00:00:00 2001
-From: "Darrick J. Wong" <djwong@kernel.org>
-Date: Thu, 4 Aug 2022 21:26:43 -0500
-Subject: [PATCH] libxfs: stop overriding MAP_SYNC in publicly exported header
- files
-
-Florian Fainelli most recently reported that xfsprogs doesn't build with
-musl on mips:
-
-"MIPS platforms building with recent kernel headers and the musl-libc
-toolchain will expose the following build failure:
-
-mmap.c: In function 'mmap_f':
-mmap.c:196:12: error: 'MAP_SYNC' undeclared (first use in this function); did you mean 'MS_SYNC'?
-  196 |    flags = MAP_SYNC | MAP_SHARED_VALIDATE;
-      |            ^~~~~~~~
-      |            MS_SYNC
-mmap.c:196:12: note: each undeclared identifier is reported only once for each function it appears in
-make[4]: *** [../include/buildrules:81: mmap.o] Error 1"
-
-At first glance, the build failure here is caused by the fact that:
-
-1. The configure script doesn't detect MAP_SYNC support
-2. The build system doesn't set HAVE_MAP_SYNC
-2. io/mmap.c includes input.h -> projects.h -> xfs.h and later sys/mman.h
-3. include/linux.h #define's MAP_SYNC to 0 if HAVE_MAP_SYNC is not set
-4. musl's sys/mman.h #undef MAP_SYNC on platforms that don't support it
-5. io/mmap.c tries to use MAP_SYNC, not realizing that libc undefined it
-
-Normally, xfs_io only exports functionality that is defined by the libc
-and/or kernel headers on the build system.  We often make exceptions for
-new functionality so that we have a way to test them before the header
-file packages catch up, hence this '#ifndef HAVE_FOO #define FOO'
-paradigm.
-
-MAP_SYNC is a gross and horribly broken example of this.  These support
-crutches are supposed to be *private* to xfsprogs for benefit of early
-testing, but they were instead added to include/linux.h, which we
-provide to user programs in the xfslibs-dev package.  IOWs, we've been
-
-Worst yet, gcc 11.3 doesn't even warn about overriding a #define to 0:
-
-int main(int argc, char *argv[]) {
-	printf("MAP_SYNC 0x%x\n", MAP_SYNC);
-}
-
-$ gcc -o a a.c -Wall
-$ ./a
-MAP_SYNC 0x80000
-$ gcc -DSTUPID -o a a.c -Wall
-$ ./a
-MAP_SYNC 0x0
-
-Four years have gone by since the introduction of MAP_SYNC, so let's get
-rid of the override code entirely -- any platform that supports MAP_SYNC
-has had plenty of chances to ensure their header files have the right
-bits.  While we're at it, fix AC_HAVE_MAP_SYNC to look for MAP_SYNC in
-the same header file that the one user (io/mmap.c) uses -- sys/mman.h.
-
-Annoyingly, I had to test this by hand because the sole fstest that
-exercises MAP_SYNC (generic/470) requires dm-logwrites and dm-thinp,
-neither of which support fsdax on current kernels.
-
-Reported-by: info@mobile-stream.com
-Reported-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Reported-by: Florian Fainelli <f.fainelli@gmail.com>
-Signed-off-by: Darrick J. Wong <djwong@kernel.org>
-Tested-by: Florian Fainelli <f.fainelli@gmail.com>
-Reviewed-by: Carlos Maiolino <cmaiolino@redhat.com>
-Signed-off-by: Eric Sandeen <sandeen@sandeen.net>
----
- include/linux.h       |  8 --------
- io/io.h               |  2 +-
- io/mmap.c             | 25 +++++++++++++------------
- m4/package_libcdev.m4 |  3 +--
- 4 files changed, 15 insertions(+), 23 deletions(-)
-
-diff --git a/include/linux.h b/include/linux.h
-index de8a71221146..052facc15db5 100644
---- a/include/linux.h
-+++ b/include/linux.h
-@@ -356,14 +356,6 @@ fsmap_advance(
- #define HAVE_GETFSMAP
- #endif /* HAVE_GETFSMAP */
- 
--#ifndef HAVE_MAP_SYNC
--#define MAP_SYNC 0
--#define MAP_SHARED_VALIDATE 0
--#else
--#include <asm-generic/mman.h>
--#include <asm-generic/mman-common.h>
--#endif /* HAVE_MAP_SYNC */
--
- /*
-  * Reminder: anything added to this file will be compiled into downstream
-  * userspace projects!
-diff --git a/io/io.h b/io/io.h
-index 49db902fc44f..64b7a663a8cf 100644
---- a/io/io.h
-+++ b/io/io.h
-@@ -55,7 +55,7 @@ typedef struct mmap_region {
- 	size_t		length;		/* length of mapping */
- 	off64_t		offset;		/* start offset into backing file */
- 	int		prot;		/* protection mode of the mapping */
--	bool		map_sync;	/* is this a MAP_SYNC mapping? */
-+	int		flags;		/* MAP_* flags passed to mmap() */
- 	char		*name;		/* name of backing file */
- } mmap_region_t;
- 
-diff --git a/io/mmap.c b/io/mmap.c
-index 8c048a0ab6d0..425957d4b487 100644
---- a/io/mmap.c
-+++ b/io/mmap.c
-@@ -46,8 +46,11 @@ print_mapping(
- 	for (i = 0, p = pflags; p->prot != PROT_NONE; i++, p++)
- 		buffer[i] = (map->prot & p->prot) ? p->mode : '-';
- 
--	if (map->map_sync)
-+#ifdef HAVE_MAP_SYNC
-+	if ((map->flags & (MAP_SYNC | MAP_SHARED_VALIDATE)) ==
-+			  (MAP_SYNC | MAP_SHARED_VALIDATE))
- 		sprintf(&buffer[i], " S");
-+#endif
- 
- 	printf("%c%03d%c 0x%lx - 0x%lx %s  %14s (%lld : %ld)\n",
- 		braces? '[' : ' ', index, braces? ']' : ' ',
-@@ -139,7 +142,9 @@ mmap_help(void)
- " -r -- map with PROT_READ protection\n"
- " -w -- map with PROT_WRITE protection\n"
- " -x -- map with PROT_EXEC protection\n"
-+#ifdef HAVE_MAP_SYNC
- " -S -- map with MAP_SYNC and MAP_SHARED_VALIDATE flags\n"
-+#endif
- " -s <size> -- first do mmap(size)/munmap(size), try to reserve some free space\n"
- " If no protection mode is specified, all are used by default.\n"
- "\n"));
-@@ -193,18 +198,14 @@ mmap_f(
- 			prot |= PROT_EXEC;
- 			break;
- 		case 'S':
-+#ifdef HAVE_MAP_SYNC
- 			flags = MAP_SYNC | MAP_SHARED_VALIDATE;
--
--			/*
--			 * If MAP_SYNC and MAP_SHARED_VALIDATE aren't defined
--			 * in the system headers we will have defined them
--			 * both as 0.
--			 */
--			if (!flags) {
--				printf("MAP_SYNC not supported\n");
--				return 0;
--			}
- 			break;
-+#else
-+			printf("MAP_SYNC not supported\n");
-+			exitcode = 1;
-+			return command_usage(&mmap_cmd);
-+#endif
- 		case 's':
- 			length2 = cvtnum(blocksize, sectsize, optarg);
- 			break;
-@@ -281,7 +282,7 @@ mmap_f(
- 	mapping->offset = offset;
- 	mapping->name = filename;
- 	mapping->prot = prot;
--	mapping->map_sync = (flags == (MAP_SYNC | MAP_SHARED_VALIDATE));
-+	mapping->flags = flags;
- 	return 0;
- }
- 
-diff --git a/m4/package_libcdev.m4 b/m4/package_libcdev.m4
-index adab9bb9773a..3a0c23453176 100644
---- a/m4/package_libcdev.m4
-+++ b/m4/package_libcdev.m4
-@@ -339,8 +339,7 @@ AC_DEFUN([AC_HAVE_STATFS_FLAGS],
- AC_DEFUN([AC_HAVE_MAP_SYNC],
-   [ AC_MSG_CHECKING([for MAP_SYNC])
-     AC_TRY_COMPILE([
--#include <asm-generic/mman.h>
--#include <asm-generic/mman-common.h>
-+#include <sys/mman.h>
-     ], [
-         int flags = MAP_SYNC | MAP_SHARED_VALIDATE;
-     ], have_map_sync=yes
--- 
-2.25.1
-
diff --git a/package/xfsprogs/xfsprogs.hash b/package/xfsprogs/xfsprogs.hash
index bb546601dc..8c73e14905 100644
--- a/package/xfsprogs/xfsprogs.hash
+++ b/package/xfsprogs/xfsprogs.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/sha256sums.asc
-sha256  01ccd3ef9df2837753a5d876b8da84ea957d13d7a461b8c46e8afa4eb09aabc8  xfsprogs-5.14.2.tar.xz
+sha256  c31868418bfbf49a3a9c47fc70cdffde9d96f4ff0051bd04a0881e6654648104  xfsprogs-6.4.0.tar.xz
 
 # Hash for license files
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 09f59a76f4..e657c8086d 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFSPROGS_VERSION = 5.14.2
+XFSPROGS_VERSION = 6.4.0
 XFSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/fs/xfs/xfsprogs
 XFSPROGS_SOURCE = xfsprogs-$(XFSPROGS_VERSION).tar.xz
 XFSPROGS_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1 (libhandle, few headers)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
