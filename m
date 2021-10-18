Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFBF7C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 12:50:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74D4060FD9
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 12:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 74D4060FD9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47EF060811;
	Mon, 18 Oct 2021 12:50:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VE2NUHDKLaA3; Mon, 18 Oct 2021 12:50:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FE6460898;
	Mon, 18 Oct 2021 12:50:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0768B1BF983
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 12:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAE1C60898
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 12:49:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wzd0ydPg0TEr for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 12:49:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA23A60811
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 12:49:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 53953869E8; Mon, 18 Oct 2021 12:46:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 14:44:51 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 9567bcf324d13ba909ff4169a2c1854ece748a52
X-Git-Newrev: adfb78c55a211326c49606c327312c651fa58ba8
X-Patchwork-Hint: ignore
Message-Id: <20211018124654.53953869E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/dfu-util: Fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=adfb78c55a211326c49606c327312c651fa58ba8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

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
