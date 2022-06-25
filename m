Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5EFC43334
	for <buildroot@archiver.kernel.org>; Sat, 25 Jun 2022 06:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9434D40A9F;
	Sat, 25 Jun 2022 06:47:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9434D40A9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6X1Jt5b-z6zI; Sat, 25 Jun 2022 06:47:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 985F340A97;
	Sat, 25 Jun 2022 06:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 985F340A97
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B1DA1BF95F
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 06:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1746C84387
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 06:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1746C84387
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cPwBKs47jczP for <buildroot@lists.busybox.net>;
 Sat, 25 Jun 2022 06:46:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A34A844F8
 for <buildroot@buildroot.org>; Sat, 25 Jun 2022 06:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A34A844F8
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3D24B87539; Sat, 25 Jun 2022 06:34:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 25 Jun 2022 08:41:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f6a98d959585aef74491b0b9f35c94df096ff80
X-Git-Newrev: 0fb9b97ca452e6f0c6404c532bb856ca4b69f0a8
X-Patchwork-Hint: ignore
Message-Id: <20220625063418.3D24B87539@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ncdu: bump to version 1.17
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

commit: https://git.buildroot.net/buildroot/commit/?id=0fb9b97ca452e6f0c6404c532bb856ca4b69f0a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of COPYING (update in year)

https://dev.yorhel.nl/ncdu/changes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncdu/ncdu.hash | 4 ++--
 package/ncdu/ncdu.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ncdu/ncdu.hash b/package/ncdu/ncdu.hash
index c2d367f15a..c47b4f9bac 100644
--- a/package/ncdu/ncdu.hash
+++ b/package/ncdu/ncdu.hash
@@ -1,5 +1,5 @@
 # From https://dev.yorhel.nl/ncdu
-sha256  2b915752a183fae014b5e5b1f0a135b4b408de7488c716e325217c2513980fd4  ncdu-1.16.tar.gz
+sha256  810745a8ed1ab3788c87d3aea4cc1a14edf6ee226f764bcc383e024ba56adbf1  ncdu-1.17.tar.gz
 
 # computed locally
-sha256  e9ed7095eee84ad6804450495738277b539da0c0b2006f50faf8e6e67a0a15aa  COPYING
+sha256  4590cb935ff8a50cee76ce12c2cb0411c0b06e84c267b478579785dcf328660d  COPYING
diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
index 59fa8deb25..acfd496ec8 100644
--- a/package/ncdu/ncdu.mk
+++ b/package/ncdu/ncdu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NCDU_VERSION = 1.16
+NCDU_VERSION = 1.17
 NCDU_SITE = http://dev.yorhel.nl/download
 
 NCDU_DEPENDENCIES = ncurses
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
