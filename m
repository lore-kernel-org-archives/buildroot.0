Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FACC433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 08:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08A97419AB;
	Fri, 18 Mar 2022 08:52:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ypyLBk6AoU8l; Fri, 18 Mar 2022 08:52:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 235BE41879;
	Fri, 18 Mar 2022 08:52:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B26C71BF215
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 08:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0C5A60BEB
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 08:52:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mJcb5aExMTPe for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 08:52:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED9DE60BCD
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 08:52:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 71C138449F; Fri, 18 Mar 2022 08:43:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 09:51:43 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 316abbf862a41d12986632ca6144945774e517f8
X-Git-Newrev: 9eb41375c2fcb7b56cce1b186b72c3eb4fd33833
X-Patchwork-Hint: ignore
Message-Id: <20220318084334.71C138449F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/ell: bump version
 to 0.48
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

commit: https://git.buildroot.net/buildroot/commit/?id=9eb41375c2fcb7b56cce1b186b72c3eb4fd33833
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

- Changelog (since 0.47, from [1]):

  ver 0.48:
    Fix issue with memory leaking from ICMPv6 RA.

[1] https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit c01a8397d9923c38b14a0d083ba1cf3ee3a3049a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ell/ell.hash | 2 +-
 package/ell/ell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index cd724eae2d..4bde1ab677 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
-sha256  4901a0baac4eb24163ceafb44fd448430361d25d8f17d89ff29f8b0b162b3eb9  ell-0.47.tar.xz
+sha256  9894943042a5d6165d3e5cc354f92274fb1304004d02b4bee682ab6067cdbbd5  ell-0.48.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index 3ce64b6f2f..267b44e5f0 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.47
+ELL_VERSION = 0.48
 ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
 ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
 ELL_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
