Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709EBCDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 18:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1799A41864;
	Fri, 13 Oct 2023 18:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1799A41864
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qG0Qe-UrDi_c; Fri, 13 Oct 2023 18:48:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1166441850;
	Fri, 13 Oct 2023 18:48:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1166441850
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 559761BF995
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE6A8417A4
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:45:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE6A8417A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jh7Ika_XKcUP for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 18:45:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CAFA4097F
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 18:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CAFA4097F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E82D84C4C; Fri, 13 Oct 2023 18:45:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 17:44:29 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 620fb8fb0f7e2d8c3d3d18960bae69b820551422
X-Git-Newrev: 010cd4640f0ed025dd9b1455b840975bd6202377
X-Patchwork-Hint: ignore
Message-Id: <20231013184521.0E82D84C4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] DEVELOPERS: add Thomas
 Petazzoni for nodejs
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

commit: https://git.buildroot.net/buildroot/commit/?id=010cd4640f0ed025dd9b1455b840975bd6202377
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 65dfac5d11596583e4e31ce83a05045a5c9a2ce6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 26d0a0c223..885cc28ed7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2915,6 +2915,7 @@ F:	package/msmtp/
 F:	package/musl/
 F:	package/musl-fts/
 F:	package/ne10/
+F:	package/nodejs/
 F:	package/pkg-python.mk
 F:	package/pkg-autotools.mk
 F:	package/pkg-generic.mk
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
