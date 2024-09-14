Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03144C02194
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 14:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC9BA41864;
	Sat, 14 Sep 2024 14:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wc-sw-lQRdwD; Sat, 14 Sep 2024 14:00:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF58D41A5B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF58D41A5B;
	Sat, 14 Sep 2024 14:00:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B82D1BF3F9
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C486B406EA
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:00:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HFnQmxmKcEWn for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 14:00:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC12E406F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC12E406F6
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 14:00:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA71B82B64; Sat, 14 Sep 2024 14:00:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 15:15:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 28cdb718eae4a91e4c42ab4202d789dc9d20a25e
X-Git-Newrev: 39b784bd5772fa14294b5da750143e5532dd68f3
X-Patchwork-Hint: ignore
Message-Id: <20240914140013.AA71B82B64@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lmbench: fix 'timing out' typo in
 patch description
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

commit: https://git.buildroot.net/buildroot/commit/?id=39b784bd5772fa14294b5da750143e5532dd68f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lmbench/0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch b/package/lmbench/0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch
index 6c3e7370e1..9702693c8e 100644
--- a/package/lmbench/0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch
+++ b/package/lmbench/0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch
@@ -1,7 +1,7 @@
 From d85b61666aa2728f68b69d02bfb162c432df709f Mon Sep 17 00:00:00 2001
 From: vgupta <vgupta@4eed8e25-bc12-0410-818a-f70ee6866280>
 Date: Sat, 3 Mar 2012 10:02:24 +0000
-Subject: [PATCH] TOO_LONG 100 usec to prevent memsize from timingout @80Mhz
+Subject: [PATCH] TOO_LONG 100 usec to prevent memsize from timing out @80Mhz
 
 git-svn-id: http://sjvm-subversion02.internal.synopsys.com/svn/OSS/ARC_Linux/tests/lmbench-3.0-a9@157318 4eed8e25-bc12-0410-818a-f70ee6866280
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
