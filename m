Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7BFAC433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 19:46:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0229861056
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 19:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0229861056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8A7E401C1;
	Sat, 13 Nov 2021 19:46:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x6PgBwkIT90A; Sat, 13 Nov 2021 19:46:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3B2240170;
	Sat, 13 Nov 2021 19:46:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F307A1BF340
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 19:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDFBA80E70
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 19:46:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Is-c2Wgd7rVK for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 19:46:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8FD880E6F
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 19:46:11 +0000 (UTC)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout12.t-online.de (Postfix) with SMTP id 4F7B2155FB
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 20:46:09 +0100 (CET)
Received: from fli4l.lan.fli4l ([91.58.5.80]) by fwd81.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mlyyT-0Pwv9l0; Sat, 13 Nov 2021 20:46:06 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:57774)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mlyyT-00047z-D5
 for buildroot@buildroot.org; Sat, 13 Nov 2021 20:46:05 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 20:46:05 +0100
Message-Id: <20211113194605.931095-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1636832766-00001460-4B70523F/0/0 CLEAN NORMAL
X-TOI-MSGID: 7926299e-31c5-435a-9333-dd4da1594c1d
Subject: [Buildroot] [PATCH/next 1/1] package/xmrig: bump version to 6.15.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/xmrig/xmrig/releases/tag/v6.15.3

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xmrig/xmrig.hash | 2 +-
 package/xmrig/xmrig.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
index 810a9381b8..7ecbb046d6 100644
--- a/package/xmrig/xmrig.hash
+++ b/package/xmrig/xmrig.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  27a6c34ee1bec60f8c49a5e2b97223971f579a26a4632fb64c4a4556b3bb04ae  xmrig-6.15.2.tar.gz
+sha256  37005e61b9ce833bef252c787a73eddce0c636b2b8737672bba59535e2c91b41  xmrig-6.15.3.tar.gz
 sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
index 071eddae32..7bcf44c70a 100644
--- a/package/xmrig/xmrig.mk
+++ b/package/xmrig/xmrig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XMRIG_VERSION = 6.15.2
+XMRIG_VERSION = 6.15.3
 XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
 XMRIG_LICENSE = GPL-3.0+
 XMRIG_LICENSE_FILES = LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
