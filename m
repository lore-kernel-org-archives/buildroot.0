Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D12BFC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 11:15:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B9D861373
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 11:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B9D861373
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6081984AE9;
	Mon,  4 Oct 2021 11:15:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pttg8u416QsR; Mon,  4 Oct 2021 11:15:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1CDB84AE0;
	Mon,  4 Oct 2021 11:15:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0FFFF1BF34A
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 11:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E7D084AE2
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 11:15:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xQOYMxv0LBw3 for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 11:15:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE228849ED
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 11:15:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CDBEF8DC50; Mon,  4 Oct 2021 11:12:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Oct 2021 12:59:30 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 1902517b8580b23430e5ac4402a47524c52e3c6b
X-Git-Newrev: 4b97c3aaecf47b52b0fb08e1d1683612f3fb0752
X-Patchwork-Hint: ignore
Message-Id: <20211004111229.CDBEF8DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] DEVELOPERS: add myself to
 trace-cmd package
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b97c3aaecf47b52b0fb08e1d1683612f3fb0752
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Add myself to trace-cmd package.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit deb6389ea7c47f646eae218c1eac1d015492864f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a380195009..4a9da88679 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1043,6 +1043,7 @@ F:	package/minicom/
 F:	package/nfs-utils/
 F:	package/sunxi-mali-mainline/
 F:	package/sunxi-mali-mainline-driver/
+F:	package/trace-cmd/
 F:	package/udisks/
 F:	toolchain/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
