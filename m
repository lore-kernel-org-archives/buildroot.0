Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27288EB64DD
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 19:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7C86607FF;
	Tue, 25 Jul 2023 19:44:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7C86607FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id meF6-DKCxmPB; Tue, 25 Jul 2023 19:44:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05CE66111B;
	Tue, 25 Jul 2023 19:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05CE66111B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 704B31BF82F
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 19:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 488BB418BE
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 19:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 488BB418BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b49_iCCcSLVA for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 19:44:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67F9D418B4
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 19:44:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67F9D418B4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A59F829FD; Tue, 25 Jul 2023 19:44:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 21:42:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e83a15172591fee73f1dff10d145ea56cbc4dc60
X-Git-Newrev: abd0b56294e77098e233eff0c906bde6b7d7f2f8
X-Patchwork-Hint: ignore
Message-Id: <20230725194433.4A59F829FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: update email address for
 Pieterjan Camerlynck
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

commit: https://git.buildroot.net/buildroot/commit/?id=abd0b56294e77098e233eff0c906bde6b7d7f2f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Pieterjan Camerlynck <pieterjanca@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index c690f1dac7..6d8b43c31e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2428,7 +2428,7 @@ F:	package/tree/
 N:	Pieter De Gendt <pieter.degendt@gmail.com>
 F:	package/libvips/
 
-N:	Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
+N:	Pieterjan Camerlynck <pieterjanca@gmail.com>
 F:	package/libdvbpsi/
 F:	package/mraa/
 F:	package/synergy/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
