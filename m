Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AE9C02181
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 08:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EE4B846BC;
	Sat, 14 Sep 2024 08:22:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xrGFTKw47LEq; Sat, 14 Sep 2024 08:22:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 808608457E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 808608457E;
	Sat, 14 Sep 2024 08:22:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 677F51BF2AB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 624224054B
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EYm_OkW0VXl2 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 08:22:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 535BA4023E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 535BA4023E
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 08:22:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C38E86F59; Sat, 14 Sep 2024 08:22:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 10:15:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c186db4741b30ae02f700e93649b7b04d5bf1ea2
X-Git-Newrev: 1961a86751cc550dd54e0c68b3bd131fad3168d4
X-Patchwork-Hint: ignore
Message-Id: <20240914082254.4C38E86F59@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/irda-utils: fix typos in patch
 descriptions
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

commit: https://git.buildroot.net/buildroot/commit/?id=1961a86751cc550dd54e0c68b3bd131fad3168d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/irda-utils/0001-daemon.patch | 2 +-
 package/irda-utils/0002-nommu.patch  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/irda-utils/0001-daemon.patch b/package/irda-utils/0001-daemon.patch
index f6034a75b4..9f01de20ae 100644
--- a/package/irda-utils/0001-daemon.patch
+++ b/package/irda-utils/0001-daemon.patch
@@ -2,7 +2,7 @@ written by Mike Frysinger
 
 https://sourceforge.net/tracker/?func=detail&aid=3132053&group_id=5616&atid=305616
 
-Rather than using the fork function (which doesnt work on nommu
+Rather than using the fork function (which doesn't work on nommu
 systems), simply use the daemon() function instead (which does
 work). this should work the same before and after for all systems.
 
diff --git a/package/irda-utils/0002-nommu.patch b/package/irda-utils/0002-nommu.patch
index bc76bd3957..13c5ad2a7c 100644
--- a/package/irda-utils/0002-nommu.patch
+++ b/package/irda-utils/0002-nommu.patch
@@ -3,7 +3,7 @@ written by Mike Frysinger
 https://sourceforge.net/tracker/?func=detail&aid=3132056&group_id=5616&atid=305616
 
 nommu systems cannot fork() as the hardware cannot support
-it. irattach uses it as a minor optimization, but it isnt
+it. irattach uses it as a minor optimization, but it isn't
 necessary for correct functioning of the utility. so add a
 NO_FORK define so we nommu peeps can do CFLAGS="... -DNO_FORK=1
 ..." and use it in our embedded systems.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
