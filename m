Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835F3C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AC7D8491B;
	Fri, 28 Feb 2025 16:46:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1fCjlaThUKHp; Fri, 28 Feb 2025 16:46:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CF4084929
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CF4084929;
	Fri, 28 Feb 2025 16:46:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F13168
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA02941A1C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hQ3hsCCAUY0f for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D104542563
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D104542563
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD86A83D12; Fri, 28 Feb 2025 16:29:49 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Dec 2024 16:45:35 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0efc06ed5193d4c18fcafb39daaf693a9e81a73e
X-Git-Newrev: 8f52d4183e8221b99b8b206fd41d6fc98255d80c
X-Patchwork-Hint: ignore
Message-Id: <20250228162949.CD86A83D12@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rt-tests: bump to
 version 2.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8f52d4183e8221b99b8b206fd41d6fc98255d80c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changes 2.7..2.8:

c8b918c53cd57fdcbb6df153064d1b2e5cc329e8 rt-tests: Change to version v2.8
84833954f7ee7ef9eec0071831355070c897e8d9 rt-tests: pi_stress:
0ef93a1735316141df5d973496db54a08956fa85 rt-tests: cyclictest: Add --deepest-idle-state to manpage
3b775a463a13f34b95d6963d6d034eb8b4690e5e rt-tests: cyclictest: Support idle state disabling via libcpupower
3372e0d56b3fa2de82cbbab361b881ba470cfbbe rt-tests: Detect libcpupower presence
fab7d905788701fd94d418126a52f74b776eb91d rt-tests: determine_maximum_mpps.sh: Get frequency from timebase-frequency if cpuinfo fails
394f7507112b394142bdded1330b28a77f70851a rt-tests: queuelat: Fix wraparound in __clock_gettime()
f2d8e34c9f2754b35327973f49d93f7b6089b8d7 rt-tests: cyclictest: Reformat help for 80 char screen
3fdf4e7130ab53e7036268c0b85f447e8ba10d9e cyclictest: Fix help text for '-a' option
d2af77295440da1c0f178aa87ff6ab9fc169dcf7 rt-tests: Add console_commands.json to gitignore
e67db31eb3fd18f1dbbc97dc7b9adb9331572f11 rt-tests: pi_stress: Move unlock into if block with matching lock
cadd661f984c0e6717e681fdaca1ce589b0ed964 rt-tests: hackbench: properly recognize when integer arguments are negative
64c7f92979ded63ac5a19ea59e9b791e3da1fae4 rt-tests: hackbench: removed extra use of optind

Patch 0002 is refreshed.

The tarball is back at $(BR2_KERNEL_MIRROR)/linux/utils/rt-tests since
it's the latest release. We have sent an e-mail to the linux-rt-users@
mailing list to ask them to stop moving the tarballs around:

  https://lore.kernel.org/linux-rt-users/20241228114346.6020d6b0@windsurf/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...akefile-drop-explicit-undefine-PYLIB-for-compatibil.patch | 12 ++++++------
 package/rt-tests/rt-tests.hash                               |  2 +-
 package/rt-tests/rt-tests.mk                                 |  4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/rt-tests/0002-Makefile-drop-explicit-undefine-PYLIB-for-compatibil.patch b/package/rt-tests/0002-Makefile-drop-explicit-undefine-PYLIB-for-compatibil.patch
index 9212b8eee0..650e63460f 100644
--- a/package/rt-tests/0002-Makefile-drop-explicit-undefine-PYLIB-for-compatibil.patch
+++ b/package/rt-tests/0002-Makefile-drop-explicit-undefine-PYLIB-for-compatibil.patch
@@ -1,4 +1,4 @@
-From 063972eece2fb8157f0feb98a4608c2984c7c5ff Mon Sep 17 00:00:00 2001
+From 17ec1bce74419f8193c0246dbde2d2fdd6b1b4e3 Mon Sep 17 00:00:00 2001
 From: Peter Korsgaard <peter@korsgaard.com>
 Date: Wed, 12 May 2021 09:18:33 +0200
 Subject: [PATCH] Makefile: drop explicit undefine PYLIB for compatibility with
@@ -30,12 +30,12 @@ Signed-off-by: Julien Olivain <ju.o@free.fr>
  1 file changed, 5 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index e2f8579..62c906f 100644
+index f656e34..1206f40 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -37,11 +37,6 @@ LDFLAGS ?=
- 
- PYLIB ?= $(shell python3 -m get_pylib)
+@@ -52,11 +52,6 @@ else
+ $(warning libcpupower disabled, building without --deepest-idle-state support.)
+ endif
  
 -# Check for errors, such as python3 not available
 -ifeq (${PYLIB},)
@@ -46,5 +46,5 @@ index e2f8579..62c906f 100644
  	   src/pi_tests/pi_stress.8 \
  	   src/ptsematest/ptsematest.8 \
 -- 
-2.45.2
+2.47.0
 
diff --git a/package/rt-tests/rt-tests.hash b/package/rt-tests/rt-tests.hash
index 9682fde406..c17829cace 100644
--- a/package/rt-tests/rt-tests.hash
+++ b/package/rt-tests/rt-tests.hash
@@ -1,4 +1,4 @@
 # From https://mirrors.edge.kernel.org/pub/linux/utils/rt-tests/sha256sums.asc
-sha256  0e5b2fbc98ceb786bd113c9a30f0388d884b2d8c4bd6c569d94ae8b00a702bbb  rt-tests-2.7.tar.xz
+sha256  13190fda63fae640a354d3378c16030f1bd4c243e514515810145dd9d1ae16d8  rt-tests-2.8.tar.xz
 # locally computed hash
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index e048ee94d0..3c6b6f2276 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-RT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/rt-tests/older
+RT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/rt-tests
 RT_TESTS_SOURCE = rt-tests-$(RT_TESTS_VERSION).tar.xz
-RT_TESTS_VERSION = 2.7
+RT_TESTS_VERSION = 2.8
 RT_TESTS_LICENSE = GPL-2.0+
 RT_TESTS_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
