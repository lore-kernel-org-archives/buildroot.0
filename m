Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6FEC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26C0041498;
	Sat, 13 Jul 2024 14:37:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id krOkSUBXGgIV; Sat, 13 Jul 2024 14:37:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEB82413C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEB82413C7;
	Sat, 13 Jul 2024 14:37:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFEF41BF41B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D5F9400A4
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vZPvcEZ40QQW for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:37:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C230640096
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C230640096
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:37:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A993B86499; Sat, 13 Jul 2024 14:37:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 16:27:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df8df20004879bd75ae2d21dcb586cb1c34ffd38
X-Git-Newrev: 673d371cf22262509e8f764615864be31b3e146e
X-Patchwork-Hint: ignore
Message-Id: <20240713143732.A993B86499@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: drop duplicated libnfc entry
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=673d371cf22262509e8f764615864be31b3e146e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch removes one of the two occurrences of libnfc from the list of
packages managed by Simon Dawson.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7c47cda42f..b841334757 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2926,7 +2926,6 @@ F:	package/lcdapi/
 F:	package/libfreefare/
 F:	package/libjson/
 F:	package/libnfc/
-F:	package/libnfc/
 F:	package/libserial/
 F:	package/libsigsegv/
 F:	package/macchanger/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
