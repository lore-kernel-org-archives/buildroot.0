Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A5E0C433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:28:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22B0960C49
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 22B0960C49
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3F6440834;
	Wed, 13 Oct 2021 18:28:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l-y-qvS8JOpc; Wed, 13 Oct 2021 18:28:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04DE340842;
	Wed, 13 Oct 2021 18:28:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 621E51BF38C
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BC404052B
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:27:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 12jM39tZNK9t for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 18:27:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75D4B4021F
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 18:27:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D80E0955F7; Wed, 13 Oct 2021 18:24:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 20:14:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ddafea9c80bd0d7faa53f14a7755fdf126a7456a
X-Git-Newrev: efef1974c566b229bd8341a9e8cd3b4feeeb3e6c
X-Patchwork-Hint: ignore
Message-Id: <20211013182444.D80E0955F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dfu-util: Fix licenses
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

commit: https://git.buildroot.net/buildroot/commit/?id=efef1974c566b229bd8341a9e8cd3b4feeeb3e6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since v0.8 a script 'dfuse-pack.py' is part of the package, which has a
different license.

Fixes: c212a90b612a ("package/dfu-util: bump version to 0.8, add hash, fix SITE url")
Signed-off-by: Alexander Dahl <post@lespocky.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dfu-util/dfu-util.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dfu-util/dfu-util.mk b/package/dfu-util/dfu-util.mk
index 9f26948a1a..4c9c9662c6 100644
--- a/package/dfu-util/dfu-util.mk
+++ b/package/dfu-util/dfu-util.mk
@@ -6,7 +6,7 @@
 
 DFU_UTIL_VERSION = 0.10
 DFU_UTIL_SITE = http://dfu-util.sourceforge.net/releases
-DFU_UTIL_LICENSE = GPL-2.0+
+DFU_UTIL_LICENSE = GPL-2.0+, LGPL-3.0
 DFU_UTIL_LICENSE_FILES = COPYING
 
 DFU_UTIL_DEPENDENCIES = libusb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
