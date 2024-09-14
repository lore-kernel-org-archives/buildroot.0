Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10563C021A8
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 17:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3B7541988;
	Sat, 14 Sep 2024 17:19:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s6f8R9phTw52; Sat, 14 Sep 2024 17:19:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20EA7419B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20EA7419B6;
	Sat, 14 Sep 2024 17:19:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 683E41BF86D
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 17:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63E2240120
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 17:19:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QnPiACe0Npzk for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 17:19:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 693F8400EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 693F8400EA
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 17:19:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5DDC283566; Sat, 14 Sep 2024 17:19:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 19:15:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9114da45e612e9c02622c7fc9bf26694e9758556
X-Git-Newrev: 52414d25f5b003774a3247f5da7036cd7ab538c5
X-Patchwork-Hint: ignore
Message-Id: <20240914171921.5DDC283566@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bdwgc: bump to version 8.2.8
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=52414d25f5b003774a3247f5da7036cd7ab538c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/ivmai/bdwgc/releases/tag/v8.2.8

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bdwgc/bdwgc.hash | 2 +-
 package/bdwgc/bdwgc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bdwgc/bdwgc.hash b/package/bdwgc/bdwgc.hash
index 8fa49b4585..8705c0f87b 100644
--- a/package/bdwgc/bdwgc.hash
+++ b/package/bdwgc/bdwgc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3d0d3cdbe077403d3106bb40f0cbb563413d6efdbb2a7e1cd6886595dec48fc2  gc-8.2.4.tar.gz
+sha256  7649020621cb26325e1fb5c8742590d92fb48ce5c259b502faf7d9fb5dabb160  gc-8.2.8.tar.gz
 sha256  a9b077aeb4e9e1aaf9742119d8023ef26f52f445cdc3f60d390bf59e1647f54a  README.QUICK
diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
index 0e9c9d849c..ca2fbdb1d4 100644
--- a/package/bdwgc/bdwgc.mk
+++ b/package/bdwgc/bdwgc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BDWGC_VERSION = 8.2.4
+BDWGC_VERSION = 8.2.8
 BDWGC_SOURCE = gc-$(BDWGC_VERSION).tar.gz
 BDWGC_SITE = https://github.com/ivmai/bdwgc/releases/download/v$(BDWGC_VERSION)
 BDWGC_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
