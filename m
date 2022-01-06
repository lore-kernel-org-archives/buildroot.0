Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DF2C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 13:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 034C3428A1;
	Thu,  6 Jan 2022 13:35:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ry7Ds5MmysO6; Thu,  6 Jan 2022 13:35:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 588E34287E;
	Thu,  6 Jan 2022 13:35:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A17B21BF409
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 13:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E49140A2E
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 13:35:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AMJXfTHqFnmp for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 13:35:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DED940A2A
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 13:35:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id D76B0832CB; Thu,  6 Jan 2022 13:29:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 6 Jan 2022 14:35:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b2a377edb9e566aded20a0d9a25200416d873c1
X-Git-Newrev: 0dc59ef8dca1965b3ed5d7b90f615a415ecbc863
X-Patchwork-Hint: ignore
Message-Id: <20220106132930.D76B0832CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5: remove qt5webkit-examples
 from qt5/Config.in
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

commit: https://git.buildroot.net/buildroot/commit/?id=0dc59ef8dca1965b3ed5d7b90f615a415ecbc863
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qt5webkit-examples was removed by commit [1]

[1] b4841d722fb37f8c8c4715c7fe8b2502c9a3a9dd

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qt5/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 6f2428d800..5751d6cb70 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -67,7 +67,6 @@ source "package/qt5/qt5virtualkeyboard/Config.in"
 source "package/qt5/qt5wayland/Config.in"
 source "package/qt5/qt5webchannel/Config.in"
 source "package/qt5/qt5webkit/Config.in"
-source "package/qt5/qt5webkit-examples/Config.in"
 source "package/qt5/qt5webengine/Config.in"
 source "package/qt5/qt5websockets/Config.in"
 source "package/qt5/qt5webview/Config.in"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
