Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F26FC83F17
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 22:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEF7940B1A;
	Mon, 28 Jul 2025 22:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VyUtrou10CWA; Mon, 28 Jul 2025 22:27:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F4CD40B2B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F4CD40B2B;
	Mon, 28 Jul 2025 22:27:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C8C69432
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 22:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA98840B1E
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 22:27:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2llFQTZuwGPD for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 22:27:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1900640B1A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1900640B1A
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 22:27:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11B9286B7A; Mon, 28 Jul 2025 22:27:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Jul 2025 00:24:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d15ffdfda7304db8a617add87478ea03ca5e095d
X-Git-Newrev: 44801fa77d8368c88c452954f3ae2d4a616651aa
X-Patchwork-Hint: ignore
Message-Id: <20250728222713.11B9286B7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Yegor Yefremov for
 package/libxmlrpc
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=44801fa77d8368c88c452954f3ae2d4a616651aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 32ed4acdc5..12a41597af 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3532,6 +3532,7 @@ F:	package/libsocketcan/
 F:	package/libubox/
 F:	package/libuci/
 F:	package/libxmlb/
+F:	package/libxmlrpc/
 F:	package/linux-firmware/
 F:	package/linux-serial-test/
 F:	package/lpac/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
