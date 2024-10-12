Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5E3CF256B
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 15:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB8B561561;
	Sat, 12 Oct 2024 15:08:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 71WeR_Ewxwd4; Sat, 12 Oct 2024 15:08:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88FC46155A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88FC46155A;
	Sat, 12 Oct 2024 15:08:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1231D1BF3F3
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A8DA606B4
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1fmi11ypb7HL for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 15:08:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16FE86066B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16FE86066B
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 15:08:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1390285ECC; Sat, 12 Oct 2024 15:08:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 17:00:32 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 9deafbfeee7e73ba94e5e4c76fef3d4cae2ba95b
X-Git-Newrev: 8d09895d4a222556a4dd26272bc967b416e7e244
X-Patchwork-Hint: ignore
Message-Id: <20241012150800.1390285ECC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/redis: fix
 'defaults' typo in patch description
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d09895d4a222556a4dd26272bc967b416e7e244
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 1e37c852a5a15978ba4b2dbc4f6630ad585c8334)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/0003-redis.conf-adjust-defauts-for-buildroot.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/redis/0003-redis.conf-adjust-defauts-for-buildroot.patch b/package/redis/0003-redis.conf-adjust-defauts-for-buildroot.patch
index 6ad81a493d..c1fc8acf6f 100644
--- a/package/redis/0003-redis.conf-adjust-defauts-for-buildroot.patch
+++ b/package/redis/0003-redis.conf-adjust-defauts-for-buildroot.patch
@@ -1,7 +1,7 @@
 From f79d1d1bf9e6f54b67e5482602084fbff7fd9cc9 Mon Sep 17 00:00:00 2001
 From: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Date: Fri, 28 Oct 2016 12:50:34 -0300
-Subject: [PATCH] redis.conf: adjust defauts for buildroot
+Subject: [PATCH] redis.conf: adjust defaults for buildroot
 
 Based on Martin Bark's patch hence archlinux package.
 We just need to specify a proper db directory.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
