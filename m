Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA0ABC433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 12:47:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B3EB60F8F
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 12:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B3EB60F8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 095C66089E;
	Mon, 18 Oct 2021 12:47:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TSzE8LFSmrrN; Mon, 18 Oct 2021 12:47:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A8CE6081B;
	Mon, 18 Oct 2021 12:47:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 450DD1BF983
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 12:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33E3A6081B
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 12:47:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fzg0ZVm9th29 for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 12:47:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FC2160811
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 12:47:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DB32086B11; Mon, 18 Oct 2021 12:44:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 14:45:19 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 8fe1f626531ec7b4a5fae97d54f9f45afc06cfcd
X-Git-Newrev: bcfaf7d573aadad1df585781fc027b9d4e05ac3c
X-Patchwork-Hint: ignore
Message-Id: <20211018124423.DB32086B11@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/dfu-util: Fix
 licenses
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

commit: https://git.buildroot.net/buildroot/commit/?id=bcfaf7d573aadad1df585781fc027b9d4e05ac3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Since v0.8 a script 'dfuse-pack.py' is part of the package, which has a
different license.

Fixes: c212a90b612a ("package/dfu-util: bump version to 0.8, add hash, fix SITE url")
Signed-off-by: Alexander Dahl <post@lespocky.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit efef1974c566b229bd8341a9e8cd3b4feeeb3e6c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dfu-util/dfu-util.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dfu-util/dfu-util.mk b/package/dfu-util/dfu-util.mk
index 5e8ba5a8f2..dd5b5691fb 100644
--- a/package/dfu-util/dfu-util.mk
+++ b/package/dfu-util/dfu-util.mk
@@ -6,7 +6,7 @@
 
 DFU_UTIL_VERSION = 0.9
 DFU_UTIL_SITE = http://dfu-util.sourceforge.net/releases
-DFU_UTIL_LICENSE = GPL-2.0+
+DFU_UTIL_LICENSE = GPL-2.0+, LGPL-3.0
 DFU_UTIL_LICENSE_FILES = COPYING
 
 DFU_UTIL_DEPENDENCIES = libusb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
