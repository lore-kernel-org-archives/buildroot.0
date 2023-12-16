Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAECC38147
	for <buildroot@archiver.kernel.org>; Sat, 16 Dec 2023 09:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3539421BE;
	Sat, 16 Dec 2023 09:59:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3539421BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oULpjse3-TJd; Sat, 16 Dec 2023 09:59:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E6BB4225C;
	Sat, 16 Dec 2023 09:59:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E6BB4225C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 37E601BF400
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 09:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EC8740123
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 09:59:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EC8740123
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QP7wwEcSEmem for <buildroot@lists.busybox.net>;
 Sat, 16 Dec 2023 09:59:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A97240114
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 09:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A97240114
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 013B687AAD; Sat, 16 Dec 2023 09:59:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 16 Dec 2023 10:56:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b0e7680cf59968f5adac6be8a68d0cdb9dd9e7f
X-Git-Newrev: e6ae6771287fdf1df2368230264a10f3763139f9
X-Patchwork-Hint: ignore
Message-Id: <20231216095902.013B687AAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: fix indentation on 2 entries
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

commit: https://git.buildroot.net/buildroot/commit/?id=e6ae6771287fdf1df2368230264a10f3763139f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Substitute spaces with tab on 2 entries for consistency.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 96f3214f94..311dcd9504 100644
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
