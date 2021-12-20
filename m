Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E5FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 16:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AAD04098A;
	Mon, 20 Dec 2021 16:33:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6RTNrfBSMu_y; Mon, 20 Dec 2021 16:33:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48EEA40988;
	Mon, 20 Dec 2021 16:33:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A1C991BF378
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 16:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CAA64093F
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 16:33:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CEn3664MyX5D for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 16:33:37 +0000 (UTC)
X-Greylist: delayed 00:06:15 by SQLgrey-1.8.0
Received: from iodev.co.uk (iodev.co.uk [46.30.189.100])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A8E940465
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 16:33:37 +0000 (UTC)
Received: from localhost (37.red-83-50-203.dynamicip.rima-tde.net
 [83.50.203.37]) by iodev.co.uk (Postfix) with ESMTPSA id 5E9F574990;
 Mon, 20 Dec 2021 17:27:20 +0100 (CET)
From: Ismael Luceno <ismael@iodev.co.uk>
To: buildroot@buildroot.org
Date: Mon, 20 Dec 2021 18:28:30 +0100
Message-Id: <20211220172830.17141-1-ismael@iodev.co.uk>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/axel: bump version to 2.17.11
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
Cc: Ismael Luceno <ismael@iodev.co.uk>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
index 552f9406521d..ca7ad5c1d3c5 100644
--- a/package/axel/axel.hash
+++ b/package/axel/axel.hash
@@ -1,2 +1,2 @@
-sha256  46eb4f10a11c4e50320ae6a034ef03ffe59dc11c3c6542a9867a3e4dc0c4b44e  axel-2.17.10.tar.xz
+sha256  580b2c18692482fd7f1e2b2819159484311ffc50f6d18924dceb80fd41d4ccf9  axel-2.17.11.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 8e3d7679e738..191484d11bd4 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AXEL_VERSION = 2.17.10
+AXEL_VERSION = 2.17.11
 AXEL_SITE = https://github.com/axel-download-accelerator/axel/releases/download/v$(AXEL_VERSION)
 AXEL_SOURCE = axel-$(AXEL_VERSION).tar.xz
 AXEL_LICENSE = GPL-2.0+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
