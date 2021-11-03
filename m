Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA90DC433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:22:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6924B6052B
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6924B6052B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CF2B40517;
	Wed,  3 Nov 2021 21:22:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id reIEtr-VO6pB; Wed,  3 Nov 2021 21:22:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 823FA40518;
	Wed,  3 Nov 2021 21:22:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14C331BF38A
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03D53403AB
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:22:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JqlJNY7yPiPM for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 21:22:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DF5C40398
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 21:22:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 83FC28A4B1; Wed,  3 Nov 2021 21:18:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 22:18:27 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 2e7548be3af6931f964568255e0dcafe9613ecd6
X-Git-Newrev: 9efe3d7cd908a1a2f598ab90266bd9f778c815c7
X-Patchwork-Hint: ignore
Message-Id: <20211103211829.83FC28A4B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] DEVELOPERS: add Joachim
 Wiberg as co-maintainer for mrouted
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

commit: https://git.buildroot.net/buildroot/commit/?id=9efe3d7cd908a1a2f598ab90266bd9f778c815c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Since I'm the upstream maintainer, it'd be nice to get Cc:ed on any
issues with the package.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6e3c73bcaf407804aacdf7f9c422559c80447186)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f55ee361aa..a4e9feb2a3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1290,6 +1290,7 @@ F:	board/globalscale/espressobin/
 F:	package/libite/
 F:	package/libuev/
 F:	package/mg/
+F:	package/mrouted/
 F:	package/netcalc/
 F:	package/ssdp-responder/
 F:	package/sysklogd/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
