Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366E4C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 14:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFB984064F;
	Sun, 24 Mar 2024 14:59:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rFzO7L62IZeu; Sun, 24 Mar 2024 14:59:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B583406A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B583406A5;
	Sun, 24 Mar 2024 14:59:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C9991BF59A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F972402A2
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:58:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PivwRB72peM8 for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 14:58:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94BBE40340
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94BBE40340
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 14:58:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8848283AED; Sun, 24 Mar 2024 14:58:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 15:48:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8c440936d51b7f76472b43002780f5490b7a3bf
X-Git-Newrev: 3646c48c64cd87cbbe9c20f25a6db9e5054628a5
X-Patchwork-Hint: ignore
Message-Id: <20240324145836.8848283AED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpc: bump to version 1.3.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3646c48c64cd87cbbe9c20f25a6db9e5054628a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.inria.fr/mpc/mpc/-/blob/1.3.1/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/mpc/mpc.hash | 2 +-
 package/mpc/mpc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpc/mpc.hash b/package/mpc/mpc.hash
index 0520a7b9b4..f69a5b66ca 100644
--- a/package/mpc/mpc.hash
+++ b/package/mpc/mpc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  17503d2c395dfcf106b622dc142683c1199431d095367c6aacba6eec30340459  mpc-1.2.1.tar.gz
+sha256  ab642492f5cf882b74aa0cb730cd410a81edcdbec895183ce930e706c1c759b8  mpc-1.3.1.tar.gz
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSER
diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index 364e4c3c85..467bed4dbe 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPC_VERSION = 1.2.1
+MPC_VERSION = 1.3.1
 MPC_SITE = $(BR2_GNU_MIRROR)/mpc
 MPC_LICENSE = LGPL-3.0+
 MPC_LICENSE_FILES = COPYING.LESSER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
