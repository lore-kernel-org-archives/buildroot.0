Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A188C7EE2F
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 17:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 972024269A;
	Sat, 10 Jun 2023 17:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 972024269A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KU1g3Lix1AWL; Sat, 10 Jun 2023 17:11:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 733C34200D;
	Sat, 10 Jun 2023 17:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 733C34200D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0EE891BF32B
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 17:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E970B8438F
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 17:11:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E970B8438F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gujBqYFUS2Mt for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 17:11:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1CD784388
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1CD784388
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 17:11:32 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout08.t-online.de (Postfix) with SMTP id 1657D7E14
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 19:11:30 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd79.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q827Y-1kkqG10; Sat, 10 Jun 2023 19:11:24 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:57184)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q827Y-0006TA-1S
 for buildroot@buildroot.org; Sat, 10 Jun 2023 19:11:24 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 10 Jun 2023 19:11:24 +0200
Message-Id: <20230610171124.1092368-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686417084-42FF7266-1E05C7B9/0/0 CLEAN NORMAL
X-TOI-MSGID: 1ac97c60-6ac6-4991-8bc7-c7a5552ae068
Subject: [Buildroot] [PATCH 1/1] package/opus: bump version to 1.4
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

Release notes:
https://opus-codec.org/release/stable/2023/04/20/libopus-1_4.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/opus/opus.hash | 2 +-
 package/opus/opus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opus/opus.hash b/package/opus/opus.hash
index 2365e47c7d..7569ee08d1 100644
--- a/package/opus/opus.hash
+++ b/package/opus/opus.hash
@@ -1,5 +1,5 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
-sha256  65b58e1e25b2a114157014736a3d9dfeaad8d41be1c8179866f144a2fb44ff9d  opus-1.3.1.tar.gz
+sha256  c9b32b4253be5ae63d1ff16eea06b94b5f0f2951b7a02aceef58e3a3ce49c51f  opus-1.4.tar.gz
 
 # Hash for license file
 sha256  8338ce8d922bb4416ce3dd1e5680173332435e3f0755007ac7801ccd674fe682  COPYING
diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index d8e0623e15..15531b521a 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPUS_VERSION = 1.3.1
+OPUS_VERSION = 1.4
 OPUS_SITE = https://downloads.xiph.org/releases/opus
 OPUS_LICENSE = BSD-3-Clause
 OPUS_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
