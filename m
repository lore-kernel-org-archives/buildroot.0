Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774FDC43334
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 06:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16D3C4148F;
	Tue, 28 Jun 2022 06:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16D3C4148F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DLWJo86gMVBJ; Tue, 28 Jun 2022 06:09:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CA61411C6;
	Tue, 28 Jun 2022 06:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CA61411C6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 99F281BF293
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 06:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 829A34148F
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 06:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 829A34148F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K6afUier_rTh for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 06:09:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA205411C6
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 06:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA205411C6
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 861E18779F; Tue, 28 Jun 2022 05:56:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 08:05:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4bb0008aa57b083dca523064ff5eaffffe93a81a
X-Git-Newrev: 3f7afc40e15f9d74f2705265de23b2d16ec80265
X-Patchwork-Hint: ignore
Message-Id: <20220628055636.861E18779F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: fix email of Dario Binacchi
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

commit: https://git.buildroot.net/buildroot/commit/?id=3f7afc40e15f9d74f2705265de23b2d16ec80265
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix email typo added by commit 776385d645b37cfc43479b37e106244aa9ab2e85

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2ed43a1c16..c3312eec34 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -656,7 +656,7 @@ F:	package/lua-cjson/
 F:	package/luaexpat/
 F:	package/xinetd/
 
-N:	Dario Binacchi <dario.binacchi@amarula.solutions.com>
+N:	Dario Binacchi <dario.binacchi@amarulasolutions.com>
 F:	package/uuu/
 
 N:	Dario Binacchi <dariobin@libero.it>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
