Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21B8C433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:29:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A580061183
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A580061183
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 736E780D7C;
	Sun, 14 Nov 2021 14:29:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ybcfj_4Ar3tu; Sun, 14 Nov 2021 14:29:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3ED080D2C;
	Sun, 14 Nov 2021 14:29:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 247981BF973
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1546880D01
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:29:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YFaATD3XHLpp for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:29:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 673C980CFC
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:29:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 01CEB8D26F; Sun, 14 Nov 2021 14:25:00 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:28:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ba85cb155e046d6b873326a6854490feb4602874
X-Git-Newrev: 5d6e55627453a80c887b26ade354a174b6b4fb04
X-Patchwork-Hint: ignore
Message-Id: <20211114142500.01CEB8D26F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lualogging: bump to
 version 1.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d6e55627453a80c887b26ade354a174b6b4fb04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lualogging/lualogging.hash | 2 +-
 package/lualogging/lualogging.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lualogging/lualogging.hash b/package/lualogging/lualogging.hash
index 45f1868856..294ef95adb 100644
--- a/package/lualogging/lualogging.hash
+++ b/package/lualogging/lualogging.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 70451dbec500dbc760f0eae666a10b19a0ba9bcbfa5dd8d3134908e5ae6d28b1  lualogging-1.5.1-1.src.rock
+sha256 d29c9c78e4266d9390069b2a5f7afacfcf9189dea12ce3774a5aa4e3cdbcd89f  lualogging-1.6.0-1.src.rock
 sha256 4d95b123e667a13615f567a829aa39211dd55b0b48c9f247bf3fcc5c0b485da7  lualogging/COPYRIGHT
diff --git a/package/lualogging/lualogging.mk b/package/lualogging/lualogging.mk
index 9c94e588a9..4d01f546e9 100644
--- a/package/lualogging/lualogging.mk
+++ b/package/lualogging/lualogging.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUALOGGING_VERSION = 1.5.1-1
+LUALOGGING_VERSION = 1.6.0-1
 LUALOGGING_SUBDIR = lualogging
 LUALOGGING_LICENSE = MIT
 LUALOGGING_LICENSE_FILES = $(LUALOGGING_SUBDIR)/COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
