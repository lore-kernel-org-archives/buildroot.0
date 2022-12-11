Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F20C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DBCA415C0;
	Mon, 20 Feb 2023 22:18:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DBCA415C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j5Mx_k2gjyes; Mon, 20 Feb 2023 22:18:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECEB941D3A;
	Mon, 20 Feb 2023 22:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECEB941D3A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E6A071BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5AB1416D0
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5AB1416D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UvYUhWiR4l-6 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 209AC40C1D
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 209AC40C1D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 106C786494; Mon, 20 Feb 2023 20:52:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 21:25:29 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2fce36d928082685d7f77c3587e15b7827ce0b42
X-Git-Newrev: ba7b0bf52bf3a749fc280d4ad5b743b5ee180828
X-Patchwork-Hint: ignore
Message-Id: <20230220205209.106C786494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] DEVELOPERS: add Thomas
 Claveirole to package vuejs
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

commit: https://git.buildroot.net/buildroot/commit/?id=ba7b0bf52bf3a749fc280d4ad5b743b5ee180828
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7f6908d0b4..7d7d2344a1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2768,6 +2768,7 @@ F:	package/x265/
 N:	Thomas Claveirole <thomas.claveirole@green-communications.fr>
 F:	package/fcgiwrap/
 F:	package/openlayers/
+F:	package/vuejs/
 F:	package/vuejs-router/
 
 N:	Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
