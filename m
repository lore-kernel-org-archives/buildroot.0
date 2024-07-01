Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA9EC3065B
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 07:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBE08819D5;
	Mon,  1 Jul 2024 07:11:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ooSiFnODmmet; Mon,  1 Jul 2024 07:11:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A5DD817AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A5DD817AA;
	Mon,  1 Jul 2024 07:11:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B41E61BF340
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 07:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1AFD4029F
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 07:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NjvTVfWfOIiC for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 07:11:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 875F640438
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 875F640438
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 07:11:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7247983774; Mon,  1 Jul 2024 07:11:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jul 2024 09:09:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7794356576d49a614a0de789f3d7413696409c4b
X-Git-Newrev: 224067105db10ad00ad1e7b2eb6444732323eb65
X-Patchwork-Hint: ignore
Message-Id: <20240701071151.7247983774@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/weston: bump to 13.0.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=224067105db10ad00ad1e7b2eb6444732323eb65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Announce:
  https://lists.freedesktop.org/archives/wayland-devel/2024-June/043655.html

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/weston/weston.hash | 6 +++---
 package/weston/weston.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index 5fa0c9d2be..62322ac639 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2024-April/043575.html
-sha256  ea1566ab4f5ffce7e9fd4f7a1fca5b30caae4d50023bf459213994094e02b29a  weston-13.0.1.tar.xz
-sha512  4a0fd0b1aec823219421d701030bc534576be64b71ede70c7d33f131e9e64c0e0dc209e62f75cecb9368df7604c1d5b2321932eccc818b529d246ec2e3114122  weston-13.0.1.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2024-June/043655.html
+sha256  27f68d96e3b97d98daadef13a202356524924fa381418fa6716b9136ef099093  weston-13.0.3.tar.xz
+sha512  60e655b57cf418902ec6e4371883354165241d9a99a712aabe2165e11ac190dec22836fd885f5178def5416dc5f00e70042b022c96a8e0aa74827bbd4563f9cb  weston-13.0.3.tar.xz
 sha256  fdb65868f65d0fbdb05c2d3b779e10ce9969fa0c4b9262ba4f260e87086ab860  COPYING
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index b708d03743..bd5a0550b1 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 13.0.1
+WESTON_VERSION = 13.0.3
 WESTON_SITE = https://gitlab.freedesktop.org/wayland/weston/-/releases/$(WESTON_VERSION)/downloads
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
