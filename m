Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B61C78820
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 10:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 920D7406EA;
	Fri, 20 Sep 2024 10:35:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kIdlMQtVMpLE; Fri, 20 Sep 2024 10:35:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97CB342C42
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97CB342C42;
	Fri, 20 Sep 2024 10:35:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 854DB1BF599
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21F5484BF7
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D4Y39ap2En0y for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 10:34:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2355284C23
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2355284C23
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 10:34:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C20707FDE7; Fri, 20 Sep 2024 10:34:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 12:33:58 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: a37afd5c2e3cf1a1211d307a68e97f72ac006b1e
X-Git-Newrev: 00378b5ae353fb5a464bb6c978df2075bf23597c
X-Patchwork-Hint: ignore
Message-Id: <20240920103451.C20707FDE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/lmbench: fix
 'timing out' typo in patch description
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

commit: https://git.buildroot.net/buildroot/commit/?id=00378b5ae353fb5a464bb6c978df2075bf23597c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 39b784bd5772fa14294b5da750143e5532dd68f3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
