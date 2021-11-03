Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61607C433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:45:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18A3A60F90
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 18A3A60F90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF37E60AE1;
	Wed,  3 Nov 2021 17:45:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a5SMxzogY6Ei; Wed,  3 Nov 2021 17:45:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52B8160AC5;
	Wed,  3 Nov 2021 17:45:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D22E41BF85D
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C29EC80DA2
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:45:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uveNcJQjbN4F for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 17:45:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3578280D6C
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 17:45:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DD6CF8A26A; Wed,  3 Nov 2021 17:41:43 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 18:45:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 193547fda4678e37636f1fb8ba1f13229c29615c
X-Git-Newrev: 6e3c73bcaf407804aacdf7f9c422559c80447186
X-Patchwork-Hint: ignore
Message-Id: <20211103174143.DD6CF8A26A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Joachim Wiberg as
 co-maintainer for mrouted
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e3c73bcaf407804aacdf7f9c422559c80447186
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since I'm the upstream maintainer, it'd be nice to get Cc:ed on any
issues with the package.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 65240615b0..4ddd855233 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1344,6 +1344,7 @@ F:	board/globalscale/espressobin/
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
