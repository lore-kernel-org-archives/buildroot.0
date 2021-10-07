Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0107C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 07:38:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7251610FB
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 07:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7251610FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 949EF405CC;
	Thu,  7 Oct 2021 07:38:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M9_xTVNnFKa5; Thu,  7 Oct 2021 07:38:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FE6C404B4;
	Thu,  7 Oct 2021 07:38:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6250E1BF48B
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 07:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A5F440441
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 07:38:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d0WK1rDyHs5F for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 07:38:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFF0F40477
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 07:38:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3F36293493; Thu,  7 Oct 2021 07:35:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 7 Oct 2021 09:38:30 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 3554ee058fa928179aac1cd737ff43f8a054438b
X-Git-Newrev: 2e200afbc9c26656fc5b39407a526c866af53cab
X-Patchwork-Hint: ignore
Message-Id: <20211007073558.3F36293493@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] DEVELOPERS: add Giulio
 Benetti to python-uvloop package
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

commit: https://git.buildroot.net/buildroot/commit/?id=2e200afbc9c26656fc5b39407a526c866af53cab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 54866ac074c705ced06624eebd068ae2afce5930)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8657ed6cd9..c07a455bba 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1040,6 +1040,7 @@ F:	package/libnspr/
 F:	package/libnss/
 F:	package/minicom/
 F:	package/nfs-utils/
+F:	package/python-uvloop/
 F:	package/sunxi-mali-mainline/
 F:	package/sunxi-mali-mainline-driver/
 F:	package/trace-cmd/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
