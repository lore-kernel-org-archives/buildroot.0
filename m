Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799DCC001B0
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 22:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A909410C3;
	Sat, 15 Jul 2023 22:25:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A909410C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2WcJeU4UrFcT; Sat, 15 Jul 2023 22:25:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42359410BA;
	Sat, 15 Jul 2023 22:25:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42359410BA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ACE111BF2F5
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 22:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 859E3410C0
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 22:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 859E3410C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ezf7Kp9sMeQ1 for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 22:25:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98A7B410B8
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 22:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98A7B410B8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 858378692A; Sat, 15 Jul 2023 22:25:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 00:24:48 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: bd0608468c6d92552c1f35b5c566b88e1965e614
X-Git-Newrev: d2ebcac1075acc478f5f0b338a8dcff3739181e5
X-Patchwork-Hint: ignore
Message-Id: <20230715222536.858378692A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] DEVELOPERS: remove Bernd
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

commit: https://git.buildroot.net/buildroot/commit/?id=d2ebcac1075acc478f5f0b338a8dcff3739181e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Remove packages which are no longer runtime-tested here.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 2aa3f61b5b3ee115dec3ca6639ff9e8bfa00b306)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 338a4013ea..7e4d6ef764 100644
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
