Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3191FEB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 12:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCABC4160F;
	Sun, 18 Jun 2023 12:48:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCABC4160F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5CdKiHebsxYX; Sun, 18 Jun 2023 12:48:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A123B415DB;
	Sun, 18 Jun 2023 12:48:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A123B415DB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 056A41BF86B
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 12:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3CED80F76
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 12:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3CED80F76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nw-QfR74kOXH for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 12:48:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EB9B80F66
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 12:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EB9B80F66
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F11F783C28; Sun, 18 Jun 2023 12:48:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jun 2023 14:46:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f8af24707b196eb64121d29a829fc31b5506409c
X-Git-Newrev: 21674cb1f7030d43e201d735b42621fd170e79b4
X-Patchwork-Hint: ignore
Message-Id: <20230618124832.F11F783C28@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ncurses: bump version to
 6.4.20230603
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

commit: https://git.buildroot.net/buildroot/commit/?id=21674cb1f7030d43e201d735b42621fd170e79b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/ThomasDickey/ncurses-snapshots/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncurses/ncurses.hash | 2 +-
 package/ncurses/ncurses.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ncurses/ncurses.hash b/package/ncurses/ncurses.hash
index a5f83c8725..b82a7b29e4 100644
--- a/package/ncurses/ncurses.hash
+++ b/package/ncurses/ncurses.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  004603a9b3ec51599ef0a0089482004ee3d33b0240d87ce17b6f77525b51fb4e  ncurses-6.4-20230429.tar.gz
+sha256  b0910671694c2c8377f579eea68477a15d67bd20ddd4b29328cfe15c62c7b3fd  ncurses-6.4-20230603.tar.gz
 # Locally computed
 sha256  0413b2f4ea863194c174673032f0fca84f1ea1ed4eed6476baea68c075a631ce  COPYING
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 4753da299c..3b805cb1fd 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -6,7 +6,7 @@
 
 # When there is no snapshost yet for a new version, set it to the empty string
 NCURSES_VERSION_MAJOR = 6.4
-NCURSES_SNAPSHOT_DATE = 20230429
+NCURSES_SNAPSHOT_DATE = 20230603
 NCURSES_VERSION = $(NCURSES_VERSION_MAJOR)$(if $(NCURSES_SNAPSHOT_DATE),-$(NCURSES_SNAPSHOT_DATE))
 NCURSES_VERSION_GIT = $(subst .,_,$(subst -,_,$(NCURSES_VERSION)))
 NCURSES_SITE = $(call github,ThomasDickey,ncurses-snapshots,v$(NCURSES_VERSION_GIT))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
