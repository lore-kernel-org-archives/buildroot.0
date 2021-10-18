Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF78C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 08:27:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28DDE60F93
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 08:27:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 28DDE60F93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C912282B21;
	Mon, 18 Oct 2021 08:27:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CQwn4VJZBFNk; Mon, 18 Oct 2021 08:27:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 309FE82868;
	Mon, 18 Oct 2021 08:27:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC13B1BF983
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 08:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6BB8608C7
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 08:27:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9VzXWB6t2Nqx for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 08:27:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C022A608C5
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 08:27:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 917D6864D8; Mon, 18 Oct 2021 08:24:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 10:25:53 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: d538cef26a1f2f8980c9eb1c2c84a1c99e9e35b9
X-Git-Newrev: 3ede30c7fef82087d6f9a0469c6fe0f1eb743d8f
X-Patchwork-Hint: ignore
Message-Id: <20211018082426.917D6864D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/bitcoin: bump
 version to 0.21.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ede30c7fef82087d6f9a0469c6fe0f1eb743d8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Release notes:
https://github.com/bitcoin/bitcoin/blob/0.21/doc/release-notes.md

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 08a60f1a1b72ca73c53df34a41c30370be3577cd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bitcoin/bitcoin.hash | 4 ++--
 package/bitcoin/bitcoin.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bitcoin/bitcoin.hash b/package/bitcoin/bitcoin.hash
index 6ea3398037..643fcbc141 100644
--- a/package/bitcoin/bitcoin.hash
+++ b/package/bitcoin/bitcoin.hash
@@ -1,5 +1,5 @@
-# From https://bitcoincore.org/bin/bitcoin-core-0.21.1/SHA256SUMS.asc
-sha256  caff23449220cf45753f312cefede53a9eac64000bb300797916526236b6a1e0  bitcoin-0.21.1.tar.gz
+# From https://bitcoincore.org/bin/bitcoin-core-0.21.2/SHA256SUMS.asc
+sha256  4146f751fc5691bdcf911cbdb8d32d8d25c297d29d58173227ae1ae6438edb9e  bitcoin-0.21.2.tar.gz
 
 # Hash for license file
 sha256  96fe807030b21f88305adc32af62f9aa19915f2783509fd6f52aea02cf83f644  COPYING
diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index 142521835c..10ae32202c 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BITCOIN_VERSION = 0.21.1
+BITCOIN_VERSION = 0.21.2
 BITCOIN_SITE = https://bitcoincore.org/bin/bitcoin-core-$(BITCOIN_VERSION)
 BITCOIN_AUTORECONF = YES
 BITCOIN_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
