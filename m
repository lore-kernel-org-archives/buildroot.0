Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3839FC433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:21:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E93B4610EA
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E93B4610EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C53F260AE7;
	Wed,  3 Nov 2021 21:21:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4QD6rGlWyQJC; Wed,  3 Nov 2021 21:21:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4336160B03;
	Wed,  3 Nov 2021 21:21:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E6D0C1BF9BA
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2AC8403A3
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:21:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OsbYnajpHgr3 for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 21:21:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 352C74039F
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 21:21:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8A3D18A4A0; Wed,  3 Nov 2021 21:17:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 22:18:22 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 1830075c47b974848c150c91d705523bec183367
X-Git-Newrev: 88391e3165e487b6fdc4326d321184beb9aa5a27
X-Patchwork-Hint: ignore
Message-Id: <20211103211743.8A3D18A4A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] DEVELOPERS: add Joachim
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

commit: https://git.buildroot.net/buildroot/commit/?id=88391e3165e487b6fdc4326d321184beb9aa5a27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

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
index 8dd926b721..5ef68f7cc0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1327,6 +1327,7 @@ F:	board/globalscale/espressobin/
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
