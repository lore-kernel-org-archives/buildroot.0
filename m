Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301FBCA1012
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 18:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1E84403B1;
	Thu,  4 Sep 2025 18:36:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g80_wr-0kRSX; Thu,  4 Sep 2025 18:36:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03BD54039B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03BD54039B;
	Thu,  4 Sep 2025 18:36:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0865D111
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 18:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDC6C80C43
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 18:36:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 56HQ7YNZ_3_B for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 18:36:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5894780C41
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5894780C41
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 18:36:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5309582A1F; Thu,  4 Sep 2025 18:36:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 20:19:02 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cb0c193c81fe0afb54de5d445b8c9dfa2831cc92
X-Git-Newrev: d652b20128b8498777db4788ae14049bcac3d58d
X-Patchwork-Hint: ignore
Message-Id: <20250904183622.5309582A1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] DEVELOPERS: add Andrea Ricchi
 for cutekeyboard
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

commit: https://git.buildroot.net/buildroot/commit/?id=d652b20128b8498777db4788ae14049bcac3d58d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 87a26b4388..fb8eedb5cf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -180,6 +180,9 @@ F:	package/libkrb5/
 F:	package/p7zip/
 F:	package/wine/
 
+N:	Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
+F:	package/cutekeyboard/
+
 N:	Andreas Klinger <ak@it-klinger.de>
 F:	package/ply/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
