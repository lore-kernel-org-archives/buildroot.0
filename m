Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A5BCF58EA
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 10:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 594A4402AD;
	Fri, 20 Sep 2024 10:34:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ne2c8YLJ5CDA; Fri, 20 Sep 2024 10:34:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29CBA403C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29CBA403C2;
	Fri, 20 Sep 2024 10:34:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B2E621BF599
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DECE40403
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:34:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vBkY5NmSa4fq for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 10:34:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABD42402AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABD42402AD
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 10:34:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 957FA83DFA; Fri, 20 Sep 2024 10:34:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 12:33:56 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 6733f2954cf3594b91821265f816e0ac692a3a54
X-Git-Newrev: 278be2f2a81ffecd44480e12e816190bcf05eec2
X-Patchwork-Hint: ignore
Message-Id: <20240920103451.957FA83DFA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/linux-fusion: fix
 version typo in patch description
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

commit: https://git.buildroot.net/buildroot/commit/?id=278be2f2a81ffecd44480e12e816190bcf05eec2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 42385486e72f845948512669c1a416c1c361dc8b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-fusion/0001-fix-for-linux-4-and-above.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-fusion/0001-fix-for-linux-4-and-above.patch b/package/linux-fusion/0001-fix-for-linux-4-and-above.patch
index 689d9bf107..bc9e936510 100644
--- a/package/linux-fusion/0001-fix-for-linux-4-and-above.patch
+++ b/package/linux-fusion/0001-fix-for-linux-4-and-above.patch
@@ -1,6 +1,6 @@
 Fix build for linux >= 4.x
 
-Instead of relying on testing for '3' as the linux kernel major verison,
+Instead of relying on testing for '3' as the linux kernel major version,
 check that it is 2.x to include the proper Makefile, otherwise forcibly
 include the .26 Makefile, that is good for 3.x and 4.x too.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
