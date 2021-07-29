Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587C2C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:52:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AE7D60E96
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1AE7D60E96
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE51040696;
	Wed,  4 Aug 2021 00:52:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YANR3FTwMWYJ; Wed,  4 Aug 2021 00:52:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E49F34069A;
	Wed,  4 Aug 2021 00:52:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D03A21BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1438640E4F
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iGNTrI8AFJeb for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F5E340FAF
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 006EB87044; Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 29 Jul 2021 22:57:14 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cb46522f3ef1f2efc5785e6151c290af78f837f2
X-Git-Newrev: 1431dbf9b6dd92a350b1eb59d04bc2d519b1c24a
X-Patchwork-Hint: ignore
Message-Id: <20210803211023.006EB87044@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/cwiid: update url
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=1431dbf9b6dd92a350b1eb59d04bc2d519b1c24a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The project URL is 404. Link to github instead.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cwiid/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
index 9dab5d1070..374a91ffd6 100644
--- a/package/cwiid/Config.in
+++ b/package/cwiid/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_CWIID
 	  A collection of Linux tools written in C for interfacing to
 	  the Nintendo Wiimote.
 
-	  http://abstrakraft.org/cwiid/
+	  https://github.com/abstrakraft/cwiid
 
 if BR2_PACKAGE_CWIID
 config BR2_PACKAGE_CWIID_WMGUI
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
