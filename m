Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A726EC47079
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 10:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6462A421AA;
	Fri,  5 Jan 2024 10:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6462A421AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JjZ1rTXudwtn; Fri,  5 Jan 2024 10:55:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2A1B421A1;
	Fri,  5 Jan 2024 10:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2A1B421A1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 79D261BF378
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 10:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5246B6143F
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 10:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5246B6143F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v_JppxvRryHi for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 10:55:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6BB961478
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 10:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6BB961478
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4E20843AE; Fri,  5 Jan 2024 10:55:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Jan 2024 11:54:37 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 3d1cafbb870bf81afcd11b24fabf002c089963e8
X-Git-Newrev: e37071ceafe5b6f551fdbac83643ffb3d8972603
X-Patchwork-Hint: ignore
Message-Id: <20240105105526.C4E20843AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] DEVELOPERS: fix
 indentation on 2 entries
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

commit: https://git.buildroot.net/buildroot/commit/?id=e37071ceafe5b6f551fdbac83643ffb3d8972603
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Substitute spaces with tab on 2 entries for consistency.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e6ae6771287fdf1df2368230264a10f3763139f9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 904c7ebf2d..706321dc13 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -74,8 +74,8 @@ F:	package/libmbim/
 F:	package/libqmi/
 F:	package/modem-manager/
 
-N:      Alessandro Partesotti <a.partesotti@gmail.com>
-F:      package/oatpp/
+N:	Alessandro Partesotti <a.partesotti@gmail.com>
+F:	package/oatpp/
 
 N:	Alex Michel <alex.michel@wiedemann-group.com>
 F:	package/libzenoh-pico/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
