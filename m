Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0C0C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 15:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A121840448;
	Sun, 11 Feb 2024 15:09:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VNUspq9626Dg; Sun, 11 Feb 2024 15:09:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54B54403CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54B54403CA;
	Sun, 11 Feb 2024 15:09:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A9EB1BF403
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 081464079A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:09:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AkjiVXFd8Zrj for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 15:09:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41D6240799
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41D6240799
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 15:09:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CACF87497; Sun, 11 Feb 2024 15:09:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 16:08:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52b43a12472a9853ff5d69b136144427c41f2803
X-Git-Newrev: 622fec1bb39fb1ca6aa9c5a9df2f93b3246be4a8
X-Patchwork-Hint: ignore
Message-Id: <20240211150926.1CACF87497@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: update Sen Hastings email
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

commit: https://git.buildroot.net/buildroot/commit/?id=622fec1bb39fb1ca6aa9c5a9df2f93b3246be4a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

phobosdpl is an old work email I don't really use anymore, so I'm
changing it to my personal email.

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1c6c84b05b..1c035eeb8f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2765,7 +2765,7 @@ F:	package/libbson/
 F:	package/lua-resty-http/
 F:	package/mpir/
 
-N:	Sen Hastings <sen@phobosdpl.com>
+N:	Sen Hastings <sen@hastings.org>
 F:	package/systemd
 F:	support/scripts/pkg-stats
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
