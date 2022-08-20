Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37D6C25B08
	for <buildroot@archiver.kernel.org>; Sat, 20 Aug 2022 09:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D3E582CE5;
	Sat, 20 Aug 2022 09:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D3E582CE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HeiLgOIFkSQZ; Sat, 20 Aug 2022 09:22:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57B9F82B97;
	Sat, 20 Aug 2022 09:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57B9F82B97
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B55D21BF2C5
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 09:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99F2182B97
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 09:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99F2182B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LkhbkbZEcjFg for <buildroot@lists.busybox.net>;
 Sat, 20 Aug 2022 09:22:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C241382AEF
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 09:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C241382AEF
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 634BF86ED3; Sat, 20 Aug 2022 09:07:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 20 Aug 2022 11:01:31 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 35b3a646e0ae44b9a4428dcedce22a61967a2384
X-Git-Newrev: 8bba793456fe887c81a6198fedc9ea8fceb59a74
X-Patchwork-Hint: ignore
Message-Id: <20220820090738.634BF86ED3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/linux-backports: bump
 version to 5.10.110
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8bba793456fe887c81a6198fedc9ea8fceb59a74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Note:
This is not the latest package version to date. This is the latest
linux-backports version which is not changing the minimal kernel version
requirement, which is kept to kernels version >= 3.10.

For commit log details, see:
https://git.kernel.org/pub/scm/linux/kernel/git/backports/backports.git/log/?h=v5.10.110-1

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-backports/linux-backports.hash | 4 ++--
 package/linux-backports/linux-backports.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-backports/linux-backports.hash b/package/linux-backports/linux-backports.hash
index 3e103424f5..83a3e54cd7 100644
--- a/package/linux-backports/linux-backports.hash
+++ b/package/linux-backports/linux-backports.hash
@@ -1,5 +1,5 @@
-# From: https://www.kernel.org/pub/linux/kernel/projects/backports/stable/v5.8/sha256sums.asc
-sha256  19b4174d89bf11ee221458e11f1e8dace26558498774b823051156f522d2036b  backports-5.8-1.tar.xz
+# From: https://www.kernel.org/pub/linux/kernel/projects/backports/stable/v5.10.110/sha256sums.asc
+sha256  3d958154080c059adaf26512430fd1a8888d65a2228e5e70e48d028201e148b1  backports-5.10.110-1.tar.xz
 # Locally computed
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
 sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
diff --git a/package/linux-backports/linux-backports.mk b/package/linux-backports/linux-backports.mk
index 068dcffcc8..a39891336d 100644
--- a/package/linux-backports/linux-backports.mk
+++ b/package/linux-backports/linux-backports.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_BACKPORTS_VERSION_MAJOR = 5.8
+LINUX_BACKPORTS_VERSION_MAJOR = 5.10.110
 LINUX_BACKPORTS_VERSION = $(LINUX_BACKPORTS_VERSION_MAJOR)-1
 LINUX_BACKPORTS_SOURCE = backports-$(LINUX_BACKPORTS_VERSION).tar.xz
 LINUX_BACKPORTS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/projects/backports/stable/v$(LINUX_BACKPORTS_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
