Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1383CC19F2E
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 14:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D079E40CF4;
	Wed, 26 Feb 2025 14:39:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id weQA3uQMJdDF; Wed, 26 Feb 2025 14:39:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77C6B40DA3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77C6B40DA3;
	Wed, 26 Feb 2025 14:39:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 573A194F
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 14:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B8C9608A3
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 14:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bu0DIBAGjB0M for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 14:39:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83C1560876
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83C1560876
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 14:39:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E90287B4C; Wed, 26 Feb 2025 14:39:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Feb 2025 15:39:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 139b580ca4aea35f5c451bce4a1b42da4cec2209
X-Git-Newrev: fee61e3d8db2b76fddf4b3e86c43a5ec4cab7c55
X-Patchwork-Hint: ignore
Message-Id: <20250226143953.7E90287B4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: update email address for
 Andreas Naumann
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

commit: https://git.buildroot.net/buildroot/commit/?id=fee61e3d8db2b76fddf4b3e86c43a5ec4cab7c55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update my email address in the DEVELOPERS file.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index c07837e431..1f04dd2a1e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -183,7 +183,7 @@ F:	package/wine/
 N:	Andreas Klinger <ak@it-klinger.de>
 F:	package/ply/
 
-N:	Andreas Naumann <ANaumann@ultratronik.de>
+N:	Andreas Naumann <dev@andin.de>
 F:	package/evemu/
 F:	package/libevdev/
 F:	package/pkg-qmake.mk
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
