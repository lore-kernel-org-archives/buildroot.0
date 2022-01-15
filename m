Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75271C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 11:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B74384010E;
	Sat, 15 Jan 2022 11:20:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xul8455c2K80; Sat, 15 Jan 2022 11:20:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92D4F40004;
	Sat, 15 Jan 2022 11:20:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2A1451BF95D
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17143400C8
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:20:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rzOEbex5bH-u for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 11:20:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40FBB40004
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 11:20:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4A9DB82A39; Sat, 15 Jan 2022 11:13:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 12:05:56 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 654d798b829c4f677fa5eca99a4a0e569ec3fa1c
X-Git-Newrev: 0b0360c73c6cca0b5b3dbe4d07e19f998cbfd169
X-Patchwork-Hint: ignore
Message-Id: <20220115111347.4A9DB82A39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] DEVELOPERS: add Andreas
 Ziegler to package/mpd
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

commit: https://git.buildroot.net/buildroot/commit/?id=0b0360c73c6cca0b5b3dbe4d07e19f998cbfd169
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

to monitor issues and changes.

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit f9ae2246045b141537af24769ed491ee3f281608)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2d7f971b25..f90224989f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -131,6 +131,9 @@ F:	package/wine/
 N:	Andreas Klinger <ak@it-klinger.de>
 F:	package/ply/
 
+N:	Andreas Ziegler <br015@umbiko.net>
+F:	package/mpd/
+
 N:	Andrey Smirnov <andrew.smirnov@gmail.com>
 F:	package/python-backports-shutil-get-terminal-size/
 F:	package/python-decorator/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
