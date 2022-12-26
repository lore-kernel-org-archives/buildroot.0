Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600ADC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10EA44F21E;
	Mon, 20 Feb 2023 22:41:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10EA44F21E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xk1emcgy-OiC; Mon, 20 Feb 2023 22:41:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5BB94F224;
	Mon, 20 Feb 2023 22:41:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5BB94F224
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2EBF51BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 129CB41701
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 129CB41701
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6fmSpB6x6VWA for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A3F0416F8
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A3F0416F8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5588786494; Mon, 20 Feb 2023 20:52:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 26 Dec 2022 09:35:26 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5a782cfd23109d9e78726bd820cb89c8146f98b5
X-Git-Newrev: 2b0ac1d62bb2b998cba17699216e9fed7caeb976
X-Patchwork-Hint: ignore
Message-Id: <20230220205215.5588786494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ncurses: fix legal info
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b0ac1d62bb2b998cba17699216e9fed7caeb976
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit a38a30eb3a46570705642dc37235ddcc1471b434 forgot to update hash of
COPYING (update in year)

Fixes:
 - http://autobuild.buildroot.org/results/18ed032d1b7e0492ed90f09873cd260997c1deae

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ncurses/ncurses.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ncurses/ncurses.hash b/package/ncurses/ncurses.hash
index 1029c1ddcb..c72a2abf46 100644
--- a/package/ncurses/ncurses.hash
+++ b/package/ncurses/ncurses.hash
@@ -62,4 +62,4 @@ sha256  32dc21b671ead8b199d66111ebd3404e8cd5f8c4ca5587cfeb5c6a4913b2d103  ncurse
 sha256  8fe3bcacaea784ac7971e102a8eb8ca58c4c2c4c13c1ec33f32334600b9e4f56  ncurses-6.3-20221203.patch.gz
 
 # Locally computed
-sha256  4d1fde61868c73776a539366dccf5d5a4857e7fd7299efb1f02e07c2afe9ea87  COPYING
+sha256  63de87399e9fc8860236082b6b0520e068e9eb1fad0ebd30202aa30bb6f690ac  COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
