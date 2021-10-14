Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A63C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:45:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15FD56105A
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15FD56105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7FA940255;
	Thu, 14 Oct 2021 21:45:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5n_edGPbRKEK; Thu, 14 Oct 2021 21:45:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4D5940598;
	Thu, 14 Oct 2021 21:45:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B8B91BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DF6281AEF
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:42:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VrBYCITJCGvl for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:42:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7523083227
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:42:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3EDDC9525D; Thu, 14 Oct 2021 21:39:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 23:33:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a5ecdf8f65bffe67097a7bb5efa4dcb6dd040b7
X-Git-Newrev: c4acebc8fb45558a73bef0bac878d153ae45ec47
X-Patchwork-Hint: ignore
Message-Id: <20211014213947.3EDDC9525D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ncdu: bump to version 1.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4acebc8fb45558a73bef0bac878d153ae45ec47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ncdu/ncdu.hash | 4 ++--
 package/ncdu/ncdu.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ncdu/ncdu.hash b/package/ncdu/ncdu.hash
index be2b6e0788..c2d367f15a 100644
--- a/package/ncdu/ncdu.hash
+++ b/package/ncdu/ncdu.hash
@@ -1,5 +1,5 @@
 # From https://dev.yorhel.nl/ncdu
-sha256  b02ddc4dbf1db139cc6fbbe2f54a282770380f0ca5c17089855eab52a9ea3fb0  ncdu-1.15.1.tar.gz
+sha256  2b915752a183fae014b5e5b1f0a135b4b408de7488c716e325217c2513980fd4  ncdu-1.16.tar.gz
 
 # computed locally
-sha256  978f49428f21714c973706030c0ef09983cc1e2889a1b7b521dbf8860870cf05  COPYING
+sha256  e9ed7095eee84ad6804450495738277b539da0c0b2006f50faf8e6e67a0a15aa  COPYING
diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
index 532f145b20..59fa8deb25 100644
--- a/package/ncdu/ncdu.mk
+++ b/package/ncdu/ncdu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NCDU_VERSION = 1.15.1
+NCDU_VERSION = 1.16
 NCDU_SITE = http://dev.yorhel.nl/download
 
 NCDU_DEPENDENCIES = ncurses
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
