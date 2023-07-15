Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A0CC0015E
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 22:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B6F5410A0;
	Sat, 15 Jul 2023 22:26:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B6F5410A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1I3QZX-uWONy; Sat, 15 Jul 2023 22:26:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21B4E410BB;
	Sat, 15 Jul 2023 22:26:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21B4E410BB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7056A1BF2F5
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 22:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49898402EB
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 22:26:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49898402EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EYP7-N0LAqul for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 22:26:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C49B400DD
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 22:26:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C49B400DD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CA1586EA2; Sat, 15 Jul 2023 22:26:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 00:24:41 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 3173b779753d1236ab15079d8713cb63645832b5
X-Git-Newrev: f629956fe63d2cc984ec87a996428a799250ffb5
X-Patchwork-Hint: ignore
Message-Id: <20230715222646.7CA1586EA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] DEVELOPERS: remove Bernd
 Kuhls from package/x11r7/
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

commit: https://git.buildroot.net/buildroot/commit/?id=f629956fe63d2cc984ec87a996428a799250ffb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Remove packages which are no longer runtime-tested here.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 2aa3f61b5b3ee115dec3ca6639ff9e8bfa00b306)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 29d367647a..aaa7196455 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -471,7 +471,6 @@ F:	package/vdr-plugin-vnsiserver/
 F:	package/vlc/
 F:	package/vnstat/
 F:	package/waylandpp/
-F:	package/x11r7/
 F:	package/x264/
 F:	package/x265/
 F:	package/xmrig/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
