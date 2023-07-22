Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F143C001DC
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 21:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED32883336;
	Sat, 22 Jul 2023 21:24:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED32883336
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t45Qxv0IDVyY; Sat, 22 Jul 2023 21:24:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D177483547;
	Sat, 22 Jul 2023 21:24:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D177483547
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE8921BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97C09415DE
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:24:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97C09415DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 14twUtOpmYYz for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 21:24:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B725415DD
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 21:24:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B725415DD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29312821B9; Sat, 22 Jul 2023 21:24:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Jul 2023 23:23:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d06e610d582e3be4b20f9939e5cab6765b7fb69a
X-Git-Newrev: 37894a5ca805920e0855671fc33b69207a050d67
X-Patchwork-Hint: ignore
Message-Id: <20230722212401.29312821B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bitwise: update for 0.50
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

commit: https://git.buildroot.net/buildroot/commit/?id=37894a5ca805920e0855671fc33b69207a050d67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bitwise/bitwise.hash | 2 +-
 package/bitwise/bitwise.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bitwise/bitwise.hash b/package/bitwise/bitwise.hash
index c8daa0aa64..9da1a4c0c5 100644
--- a/package/bitwise/bitwise.hash
+++ b/package/bitwise/bitwise.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f524f794188a10defc4df673d8cf0b3739f93e58e93aff0cdb8a99fbdcca2ffb  bitwise-v0.43.tar.gz
+sha256  806271fa5bf31de0600315e8720004a8f529954480e991ca84a9868dc1cae97e  bitwise-v0.50.tar.gz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/bitwise/bitwise.mk b/package/bitwise/bitwise.mk
index 33d8f6776b..5bce92fcf7 100644
--- a/package/bitwise/bitwise.mk
+++ b/package/bitwise/bitwise.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BITWISE_VERSION = 0.43
+BITWISE_VERSION = 0.50
 BITWISE_SITE = https://github.com/mellowcandle/bitwise/releases/download/v$(BITWISE_VERSION)
 BITWISE_SOURCE = bitwise-v$(BITWISE_VERSION).tar.gz
 BITWISE_DEPENDENCIES = ncurses readline
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
