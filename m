Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCA1C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 20:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E68C240602;
	Tue, 14 Dec 2021 20:10:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0x8vMvr86YuO; Tue, 14 Dec 2021 20:10:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEBE5405EA;
	Tue, 14 Dec 2021 20:10:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B1DC21BF9B4
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A17B84095F
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:10:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v4FO8AzR96RX for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 20:10:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7172408F1
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 20:10:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E002081EB3; Tue, 14 Dec 2021 20:05:19 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 20:56:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0f1c1fbb9be684917f51bbe7888cd44e375a96e
X-Git-Newrev: f9ae2246045b141537af24769ed491ee3f281608
X-Patchwork-Hint: ignore
Message-Id: <20211214200519.E002081EB3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Andreas Ziegler to
 package/mpd
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

commit: https://git.buildroot.net/buildroot/commit/?id=f9ae2246045b141537af24769ed491ee3f281608
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

to monitor issues and changes.

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7abac2421d..d64c1b063a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -133,6 +133,9 @@ F:	package/wine/
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
