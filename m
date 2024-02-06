Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C97C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F6B3415BB;
	Tue,  6 Feb 2024 16:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F6B3415BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z04qITxcnYZj; Tue,  6 Feb 2024 16:04:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 844FE415B6;
	Tue,  6 Feb 2024 16:04:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 844FE415B6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E63E1BF2FE
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 877EB81AF3
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:03:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gr0X2p_mADUk for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:03:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D97A281AF4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D97A281AF4
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:03:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C58528711A; Tue,  6 Feb 2024 16:03:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 17:02:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1e6d7845b0f3b450709b84a6e4fc4527f12b196
X-Git-Newrev: b4639b493a9729e1d8bfe0839aed871f1a96a207
X-Patchwork-Hint: ignore
Message-Id: <20240206160322.C58528711A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual/contribute.adoc: link to
 git-send-email.io
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4639b493a9729e1d8bfe0839aed871f1a96a207
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://git-send-email.io/ is a page maintained by sourcehut which
explains how to setup git send-email on many OS's for many popular email
providers.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/contribute.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
index 2b90d13b41..684e9f4809 100644
--- a/docs/manual/contribute.adoc
+++ b/docs/manual/contribute.adoc
@@ -369,7 +369,7 @@ $ git send-email origin/master
 ---------------------
 
 Note that +git+ should be configured to use your mail account.
-To configure +git+, see +man git-send-email+ or google it.
+To configure +git+, see +man git-send-email+ or https://git-send-email.io/.
 
 If you do not use +git send-email+, make sure posted *patches are not
 line-wrapped*, otherwise they cannot easily be applied. In such a case,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
