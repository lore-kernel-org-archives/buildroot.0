Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5454CF3962
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 19:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C6CE414EE;
	Thu, 19 Sep 2024 19:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lfkh5YNNApmd; Thu, 19 Sep 2024 19:58:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27576414C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27576414C6;
	Thu, 19 Sep 2024 19:58:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 739641BF980
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 19:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6225541498
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 19:58:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wSPIATg_3S4Q for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 19:58:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6467140E0C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6467140E0C
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 19:58:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A95583CF4; Thu, 19 Sep 2024 19:58:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 13:56:14 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: cd0361c0fe624dfd4628f81430cb067f414b020d
X-Git-Newrev: 4708f1e32b3c810296308ebb5aa58a4e19225144
X-Patchwork-Hint: ignore
Message-Id: <20240919195837.5A95583CF4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/irda-utils: fix
 typos in patch descriptions
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

commit: https://git.buildroot.net/buildroot/commit/?id=4708f1e32b3c810296308ebb5aa58a4e19225144
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1961a86751cc550dd54e0c68b3bd131fad3168d4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
