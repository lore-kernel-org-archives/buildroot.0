Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362CBC3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8554614D7;
	Mon, 19 May 2025 10:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BJaB5BThz045; Mon, 19 May 2025 10:56:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0722C6F66E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0722C6F66E;
	Mon, 19 May 2025 10:56:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12C74D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31363410B3
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BgKSa0_uqTuU for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73CB140734
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73CB140734
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E2C4872E7; Mon, 19 May 2025 10:39:58 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 1 May 2025 21:34:07 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 032b2688909a1621aa8ae1397ee0c785423b6455
X-Git-Newrev: b8e8cf6ea0f65161510debbe4de53a6efb5568b1
X-Patchwork-Hint: ignore
Message-Id: <20250519103958.6E2C4872E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] DEVELOPERS: update email for
 Titouan Christophe
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

commit: https://git.buildroot.net/buildroot/commit/?id=b8e8cf6ea0f65161510debbe4de53a6efb5568b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 15389d530b..8c26ee3f22 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3291,7 +3291,7 @@ F:	toolchain/
 N:	Timo Ketola <timo.ketola@exertus.fi>
 F:	package/fbgrab/
 
-N:	Titouan Christophe <titouanchristophe@gmail.com>
+N:	Titouan Christophe <titouan.christophe@mind.be>
 F:	package/avro-c/
 F:	package/mosquitto/
 F:	package/python-avro/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
