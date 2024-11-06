Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00638D59F6E
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 20:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7ED581335;
	Wed,  6 Nov 2024 20:12:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OpVWmbo-yJNL; Wed,  6 Nov 2024 20:12:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3BDA812FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3BDA812FF;
	Wed,  6 Nov 2024 20:12:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 61FF03B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A65F40282
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:12:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pDIcjoUSn3Ph for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 20:12:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A2C4400D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A2C4400D7
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:12:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4355F85E01; Wed,  6 Nov 2024 20:12:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Nov 2024 21:09:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5fa1952b72fb4fdb92cb8a7221562341237f6987
X-Git-Newrev: a6f672846a653a8278704688514369441f9283a5
X-Patchwork-Hint: ignore
Message-Id: <20241106201216.4355F85E01@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libzenoh-c: bump to version 1.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a6f672846a653a8278704688514369441f9283a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/eclipse-zenoh/zenoh-c/releases/tag/1.0.1

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
[Peter: drop 1.0.0.12 comment]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libzenoh-c/libzenoh-c.hash | 2 +-
 package/libzenoh-c/libzenoh-c.mk   | 5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/libzenoh-c/libzenoh-c.hash b/package/libzenoh-c/libzenoh-c.hash
index 3472494355..124128736e 100644
--- a/package/libzenoh-c/libzenoh-c.hash
+++ b/package/libzenoh-c/libzenoh-c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  80e3144ebd82bdbfb43ff10e7f22047826adbbe0d0ed0081b215924a6c1bdb6c  libzenoh-c-1.0.0-cargo2.tar.gz
+sha256  7765bc1bdbab608da4770db7624ec868ac3cdf7e63707d7aff406d85558bfc15  libzenoh-c-1.0.1-cargo2.tar.gz
 sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
diff --git a/package/libzenoh-c/libzenoh-c.mk b/package/libzenoh-c/libzenoh-c.mk
index c474d98b07..c037420d86 100644
--- a/package/libzenoh-c/libzenoh-c.mk
+++ b/package/libzenoh-c/libzenoh-c.mk
@@ -4,10 +4,7 @@
 #
 ################################################################################
 
-# This 1.0.0 version is really newer than 1.0.0.12, so please don't
-# update 1.0.0 even if release-monitoring.org claims it's a newer
-# version.
-LIBZENOH_C_VERSION = 1.0.0
+LIBZENOH_C_VERSION = 1.0.1
 LIBZENOH_C_SITE = $(call github,eclipse-zenoh,zenoh-c,$(LIBZENOH_C_VERSION))
 LIBZENOH_C_LICENSE = Apache-2.0 or EPL-2.0
 LIBZENOH_C_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
