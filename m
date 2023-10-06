Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77E4E81E0B
	for <buildroot@archiver.kernel.org>; Fri,  6 Oct 2023 15:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1478A83C34;
	Fri,  6 Oct 2023 15:32:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1478A83C34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S2OyfwO3lxvR; Fri,  6 Oct 2023 15:32:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D88283C2F;
	Fri,  6 Oct 2023 15:32:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D88283C2F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BFF031BF32D
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 15:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98CC142E8A
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 15:32:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98CC142E8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BjBHGGm5vLzN for <buildroot@lists.busybox.net>;
 Fri,  6 Oct 2023 15:32:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A1CB42628
 for <buildroot@buildroot.org>; Fri,  6 Oct 2023 15:32:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A1CB42628
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 71FEE842FC; Fri,  6 Oct 2023 15:32:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Oct 2023 17:31:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c7568d6bb53532945c60f0b1794cacce10fae36
X-Git-Newrev: 65dfac5d11596583e4e31ce83a05045a5c9a2ce6
X-Patchwork-Hint: ignore
Message-Id: <20231006153223.71FEE842FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Thomas Petazzoni for nodejs
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=65dfac5d11596583e4e31ce83a05045a5c9a2ce6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c45e7315da..3fffc4346c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2946,6 +2946,7 @@ F:	package/msmtp/
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
