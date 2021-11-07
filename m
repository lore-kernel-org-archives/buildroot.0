Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57953C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 20:20:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F18E960F0F
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 20:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F18E960F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C32BF400D8;
	Sun,  7 Nov 2021 20:20:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HmtkJBYlRpNx; Sun,  7 Nov 2021 20:20:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D17044024F;
	Sun,  7 Nov 2021 20:20:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 264CF1BF28A
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 20:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30C7580D71
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 20:20:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3-Pd_xGpY9uc for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 20:20:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71CAB80D34
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 20:20:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9DF468B495; Sun,  7 Nov 2021 20:16:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Nov 2021 21:16:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 825bf865293e4e5251dae7d65e94e03f906d79b4
X-Git-Newrev: 052cbfb0c70e22121312a086815c7f71b693c414
X-Patchwork-Hint: ignore
Message-Id: <20211107201628.9DF468B495@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/exim: bump version to 4.95
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

commit: https://git.buildroot.net/buildroot/commit/?id=052cbfb0c70e22121312a086815c7f71b693c414
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.exim.org/lurker/message/20210928.211934.67f92669.en.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exim/exim.hash | 4 ++--
 package/exim/exim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index 201f09ebd6..5cbad08a4b 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
 # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
-sha256  051861fc89f06205162f12129fb7ebfe473383bb6194bf8642952bfd50329274  exim-4.94.2.tar.xz
+sha256  cc9cb653fff2ea947c3702680b59c99ac0bd1bbf19976d37e22a463cd804f167  exim-4.95.tar.xz
 # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
-sha512  5334c236221ed4e03dbc33e6a79d939b06037fa2f4b71971607a360b67af5c85a89681ee13a5eeaf0184382c55a160cf2e89ed7afb2949f025a54f1e88f9e3fc  exim-4.94.2.tar.xz
+sha512  93d09c20d99f27da5edbe3e6dc7d25aa4548faa2b67ca26f2cc0b4aeaf58398dd468e0263714fcf0df97531f05d16fcd3f1f0e9d0656ead7858a66b248a44a65  exim-4.95.tar.xz
 # Locally calculated
 sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index e90419a286..b45458b21b 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.94.2
+EXIM_VERSION = 4.95
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
