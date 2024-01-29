Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0D4C47DA9
	for <buildroot@archiver.kernel.org>; Mon, 29 Jan 2024 21:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE26940734;
	Mon, 29 Jan 2024 21:26:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE26940734
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GMRmLfbiMbWw; Mon, 29 Jan 2024 21:26:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA0AE401B2;
	Mon, 29 Jan 2024 21:26:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA0AE401B2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0315E1BF39F
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 21:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0A5260BA2
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 21:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0A5260BA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bhSv2oMggolA for <buildroot@lists.busybox.net>;
 Mon, 29 Jan 2024 21:26:43 +0000 (UTC)
X-Greylist: delayed 461 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 29 Jan 2024 21:26:42 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB9AD606A9
Received: from iodev.co.uk (iodev.co.uk [46.30.189.100])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB9AD606A9
 for <buildroot@buildroot.org>; Mon, 29 Jan 2024 21:26:42 +0000 (UTC)
Received: from localhost (103.red-83-50-211.dynamicip.rima-tde.net
 [83.50.211.103])
 by iodev.co.uk (Postfix) with ESMTPSA id 6B65228A6D2;
 Mon, 29 Jan 2024 22:18:58 +0100 (CET)
From: Ismael Luceno <ismael@iodev.co.uk>
To: buildroot@buildroot.org
Date: Mon, 29 Jan 2024 22:18:49 +0100
Message-ID: <20240129211856.24093-1-ismael@iodev.co.uk>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam: Yes
Subject: [Buildroot] [PATCH] package/axel: bump version to 2.17.12
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
Cc: Ismael Luceno <ismael@iodev.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
---
 package/axel/axel.hash | 2 +-
 package/axel/axel.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/axel/axel.hash b/package/axel/axel.hash
index ca7ad5c1d3c5..ebcdc652fc7f 100644
--- a/package/axel/axel.hash
+++ b/package/axel/axel.hash
@@ -1,2 +1,2 @@
-sha256  580b2c18692482fd7f1e2b2819159484311ffc50f6d18924dceb80fd41d4ccf9  axel-2.17.11.tar.xz
+sha256  fb4e70535ebf732211af253bfe24f9ada57d80fd465ac02c721406c7d4e1d496  axel-2.17.12.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 191484d11bd4..b3896e86e31e 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AXEL_VERSION = 2.17.11
+AXEL_VERSION = 2.17.12
 AXEL_SITE = https://github.com/axel-download-accelerator/axel/releases/download/v$(AXEL_VERSION)
 AXEL_SOURCE = axel-$(AXEL_VERSION).tar.xz
 AXEL_LICENSE = GPL-2.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
