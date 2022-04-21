Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76F2C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 21:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FF804112F;
	Thu, 21 Apr 2022 21:04:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JArlBxJ0p70E; Thu, 21 Apr 2022 21:04:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A55FE41109;
	Thu, 21 Apr 2022 21:04:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BEB9C1C1189
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE2C3419DA
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:02:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ng1JZDgxlv6S for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 21:02:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B75241C4A
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 21:02:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DE41784104; Thu, 21 Apr 2022 20:52:06 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 22:32:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d81d082aaaa105fa8ac8d06a4bc9d63cef6352c
X-Git-Newrev: 908caefa91dbf70e7f40c61113f0f1ae2b83230d
X-Patchwork-Hint: ignore
Message-Id: <20220421205206.DE41784104@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/coreutils: bump version to 9.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=908caefa91dbf70e7f40c61113f0f1ae2b83230d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/coreutils/coreutils.hash | 4 ++--
 package/coreutils/coreutils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/coreutils/coreutils.hash b/package/coreutils/coreutils.hash
index 758a6341a3..eb9a5744c6 100644
--- a/package/coreutils/coreutils.hash
+++ b/package/coreutils/coreutils.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256 ce30acdf4a41bc5bb30dd955e9eaa75fa216b4e3deb08889ed32433c7b3b97ce  coreutils-9.0.tar.xz
+sha256  61a1f410d78ba7e7f37a5a4f50e6d1320aca33375484a3255eddf17a38580423  coreutils-9.1.tar.xz
 # Locally computed
-sha256 3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 438b7910eb..931859b0ac 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COREUTILS_VERSION = 9.0
+COREUTILS_VERSION = 9.1
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
