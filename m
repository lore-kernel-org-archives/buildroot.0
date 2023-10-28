Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43AAC4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 21:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 696084005E;
	Sat, 28 Oct 2023 21:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 696084005E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LbVMR4TCvkVQ; Sat, 28 Oct 2023 21:05:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F2144177D;
	Sat, 28 Oct 2023 21:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F2144177D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 25B681BF32C
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92E99613A4
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92E99613A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n7cyXaA8FcKX for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 21:03:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38772613BF
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 21:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38772613BF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2981D8607A; Sat, 28 Oct 2023 21:03:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 22:50:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 654f18c61709cf8c7d92236c1b81bb80a9ce70d6
X-Git-Newrev: e324475294bf4714d81dfc3e8fe5f2c62335fb9f
X-Patchwork-Hint: ignore
Message-Id: <20231028210322.2981D8607A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cli11: bump to version 2.3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=e324475294bf4714d81dfc3e8fe5f2c62335fb9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of LICENSE file (update in year:
https://github.com/CLIUtils/CLI11/commit/39a5f1981e9395e82be863e77b4b0c69239ec338)

https://github.com/CLIUtils/CLI11/releases/tag/v2.3.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cli11/cli11.hash | 4 ++--
 package/cli11/cli11.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cli11/cli11.hash b/package/cli11/cli11.hash
index 12e5b4fb55..42ab5d1311 100644
--- a/package/cli11/cli11.hash
+++ b/package/cli11/cli11.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  378da73d2d1d9a7b82ad6ed2b5bda3e7bc7093c4034a1d680a2e009eb067e7b2  cli11-2.3.1.tar.gz
-sha256  89022151dbf5827a22430557ef2f8a75808dd25fa1e9a12709ef5421d363e66d  LICENSE
+sha256  aac0ab42108131ac5d3344a9db0fdf25c4db652296641955720a4fbe52334e22  cli11-2.3.2.tar.gz
+sha256  4110754959bd99e0ebc34001ed0402ff5f371364e83f9db6d1e230d02368984f  LICENSE
diff --git a/package/cli11/cli11.mk b/package/cli11/cli11.mk
index b02bd4478f..349c14fe60 100644
--- a/package/cli11/cli11.mk
+++ b/package/cli11/cli11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLI11_VERSION = 2.3.1
+CLI11_VERSION = 2.3.2
 CLI11_SITE = $(call github,CLIUtils,CLI11,v$(CLI11_VERSION))
 CLI11_LICENSE = BSD-3-Clause
 CLI11_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
