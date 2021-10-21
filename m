Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A8BC433FE
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:35:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1116F61354
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1116F61354
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFC8B60619;
	Thu, 21 Oct 2021 20:35:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FXGOri0e4tvx; Thu, 21 Oct 2021 20:35:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44044605F8;
	Thu, 21 Oct 2021 20:35:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 250441BF318
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D5F882BBA
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:35:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O-EwzXGuBcRz for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 20:35:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53D7F832D9
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 20:35:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F01D388342; Thu, 21 Oct 2021 20:32:01 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Oct 2021 22:27:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 779767d947fd7e0aefeece146322935bef41ebc5
X-Git-Newrev: 9b86891c8e12bac0a2d56dd1c9dc79f5bae7319d
X-Patchwork-Hint: ignore
Message-Id: <20211021203201.F01D388342@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bison: bump to version 3.8.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b86891c8e12bac0a2d56dd1c9dc79f5bae7319d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/bison/bison.hash | 4 ++--
 package/bison/bison.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bison/bison.hash b/package/bison/bison.hash
index 04b6ca03e4..98ce5b97a3 100644
--- a/package/bison/bison.hash
+++ b/package/bison/bison.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature from
-# http://mirror.keystealth.org/gnu/bison/bison-3.8.1.tar.xz.sig
-sha256  31fc602488aad6bdecf0ccc556e0fc72fc57cdc595cf92398f020e0cf4980f15  bison-3.8.1.tar.xz
+# http://mirror.keystealth.org/gnu/bison/bison-3.8.2.tar.xz.sig
+sha256  9bba0214ccf7f1079c5d59210045227bcf619519840ebfa80cd3849cff5a5bf2  bison-3.8.2.tar.xz
 # License files, locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 8413233063..27038de674 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BISON_VERSION = 3.8.1
+BISON_VERSION = 3.8.2
 BISON_SOURCE = bison-$(BISON_VERSION).tar.xz
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
 BISON_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
