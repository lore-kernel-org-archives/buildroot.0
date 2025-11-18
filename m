Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56571CCD19A
	for <buildroot@archiver.kernel.org>; Tue, 18 Nov 2025 07:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93443417E0;
	Tue, 18 Nov 2025 07:12:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nfcljtu7oH23; Tue, 18 Nov 2025 07:12:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B831F4174B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B831F4174B;
	Tue, 18 Nov 2025 07:12:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 243F71BA
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 07:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A4B640214
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 07:12:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Gcja8TGK8uQ for <buildroot@buildroot.org>;
 Tue, 18 Nov 2025 07:12:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C4B340203
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C4B340203
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 07:12:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 596EC84E16; Tue, 18 Nov 2025 07:12:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 18 Nov 2025 08:05:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6d8b5823a7ed5a4c73318bb1d6c52405481dc48
X-Git-Newrev: 88c26c48145403f34880a455d47bb9191e8f1124
X-Patchwork-Hint: ignore
Message-Id: <20251118071243.596EC84E16@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Julien Corjon,
 e-mail bounces
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=88c26c48145403f34880a455d47bb9191e8f1124
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

<corjon.j@ecagroup.com>: host ecagroup-com.mail.protection.outlook.com[52.101.166.0]
 said: 550 5.4.1 Recipient address rejected: Access denied.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5458dbd590..0272b4ba33 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1789,9 +1789,6 @@ F:	package/libmodbus/
 F:	package/ltris/
 F:	package/opentyrian/
 
-N:	Julien Corjon <corjon.j@ecagroup.com>
-F:	package/qt5/
-
 N:	Julien Grossholtz <julien.grossholtz@openest.io>
 F:	board/raspberrypi/
 F:	configs/raspberrypizero2w_defconfig
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
