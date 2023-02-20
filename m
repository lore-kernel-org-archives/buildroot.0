Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495BFC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1C5E7027B;
	Tue, 21 Feb 2023 02:04:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1C5E7027B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gA38i_Vbq9W6; Tue, 21 Feb 2023 02:04:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DC1570188;
	Tue, 21 Feb 2023 02:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DC1570188
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA6EC1BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F9087002F
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F9087002F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C6c0xhqqTm1C for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FC977001F
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FC977001F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0891381979; Mon, 20 Feb 2023 20:53:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 09:23:53 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7b4937a1709a88f90abbeac48e2e2db33b83d44b
X-Git-Newrev: bd351c4e933e48f380cc8924d1659b220d13b70c
X-Patchwork-Hint: ignore
Message-Id: <20230220205303.0891381979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] DEVELOPERS: remove Shyam Saini
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bd351c4e933e48f380cc8924d1659b220d13b70c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Shyam's email address at Savoir Faire Linux is bouncing, so drop they
from the DEVELOPERS file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index a7a0bb14d1..2eff5b23ef 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2605,9 +2605,6 @@ F:	package/tunctl/
 F:	package/ubus/
 F:	package/wolfssl/
 
-N:	Shyam Saini <shyam.saini@savoirfairelinux.com>
-F:	package/cukinia/
-
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
 F:	package/cppzmq/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
