Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B958DC433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 09:52:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11F90611C1
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 09:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11F90611C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5FB460E72;
	Thu,  7 Oct 2021 09:52:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9pJ7Om7JzQdN; Thu,  7 Oct 2021 09:52:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A7A760F80;
	Thu,  7 Oct 2021 09:52:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CFF51BF873
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 09:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52B5A403A4
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 09:52:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 56a9MEfYfGAU for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 09:52:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0ED93400EA
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 09:51:59 +0000 (UTC)
Received: (Authenticated sender: kamel.bouhara@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E28F620014;
 Thu,  7 Oct 2021 09:51:56 +0000 (UTC)
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: buildroot@buildroot.org
Date: Thu,  7 Oct 2021 11:51:43 +0200
Message-Id: <20211007095147.688449-3-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007095147.688449-1-kamel.bouhara@bootlin.com>
References: <20211007095147.688449-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 3/7] package/sunxi-mali-mainline: bump version
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kamel Bouhara <kamel.bouhara@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Bumps the sunxi-mali-mainline upstream version to 418f55585e76f375792dbebb3e97532f0c1c556d

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
Changes v1 -> v2:
 - Updated package hash

 package/sunxi-mali-mainline/sunxi-mali-mainline.hash | 2 +-
 package/sunxi-mali-mainline/sunxi-mali-mainline.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sunxi-mali-mainline/sunxi-mali-mainline.hash b/package/sunxi-mali-mainline/sunxi-mali-mainline.hash
index e1c18fd4f7..96d8251f16 100644
--- a/package/sunxi-mali-mainline/sunxi-mali-mainline.hash
+++ b/package/sunxi-mali-mainline/sunxi-mali-mainline.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  72969ecf470b9e5ce787c2f8f36242926e1e892af0891924ee59a2cd206de39f  sunxi-mali-mainline-d691cb93884ca8ac67860502117bbec283dc19aa.tar.gz
+sha256  b5e7e8f9f2886ed0b273f72ea16ae4868711726fe33e3d80ef24e86269c90fd2  sunxi-mali-mainline-418f55585e76f375792dbebb3e97532f0c1c556d.tar.gz
 sha256  8a06bcae44a41a886f339b4338422415a786787f113e9ed6456ae117104a0b6a  EULA_for_Mali_400MP_AW.pdf
diff --git a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
index 701a1fbbb4..b46f572311 100644
--- a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
+++ b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_MALI_MAINLINE_VERSION = d691cb93884ca8ac67860502117bbec283dc19aa
+SUNXI_MALI_MAINLINE_VERSION = 418f55585e76f375792dbebb3e97532f0c1c556d
 SUNXI_MALI_MAINLINE_SITE = $(call github,bootlin,mali-blobs,$(SUNXI_MALI_MAINLINE_VERSION))
 SUNXI_MALI_MAINLINE_INSTALL_STAGING = YES
 SUNXI_MALI_MAINLINE_PROVIDES = libegl libgles
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
