Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ACE9C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 11:16:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C6BA61381
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 11:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C6BA61381
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F4DD61B61;
	Mon,  4 Oct 2021 11:16:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hekLL0sv05QF; Mon,  4 Oct 2021 11:16:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8569961B6A;
	Mon,  4 Oct 2021 11:16:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 503EB1BF97D
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 11:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3026D427B8
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 11:15:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xMscidoD7Sna for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 11:15:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 326314279C
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 11:15:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0D91D8DC77; Mon,  4 Oct 2021 11:12:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Oct 2021 12:59:45 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 2f9248e5c855b869fe99dbc577dd3478472b1850
X-Git-Newrev: 6fcaf8b45e8341f7cf0f30c520d49cbb86c9e8db
X-Patchwork-Hint: ignore
Message-Id: <20211004111234.0D91D8DC77@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] DEVELOPERS: add myself to
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

commit: https://git.buildroot.net/buildroot/commit/?id=6fcaf8b45e8341f7cf0f30c520d49cbb86c9e8db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Add myself to trace-cmd package.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit deb6389ea7c47f646eae218c1eac1d015492864f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7018aa31b4..cf980ce20c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1034,6 +1034,7 @@ F:	package/minicom/
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
