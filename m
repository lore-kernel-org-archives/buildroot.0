Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FBEE7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 13:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8005817C0;
	Mon, 23 Dec 2024 13:59:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0-Amb11wEVqf; Mon, 23 Dec 2024 13:59:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C74D981846
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C74D981846;
	Mon, 23 Dec 2024 13:59:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B0A41D3
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 13:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EB2D40B25
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 13:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MT0pIDSRZNfz for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 13:59:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=77.55.128.204;
 helo=mail.grinn-global.com; envelope-from=m.niestroj@grinn-global.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6360B40A7A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6360B40A7A
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6360B40A7A
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 13:59:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (19)
Received: from zm.. (pub-25.182.29.194.multiplay.pl [194.29.182.25])
 by server220076.nazwa.pl (Postfix) with ESMTP id 6B0C81BE29A;
 Mon, 23 Dec 2024 14:59:29 +0100 (CET)
From: Marcin Niestroj <m.niestroj@grinn-global.com>
To: buildroot@buildroot.org
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Mon, 23 Dec 2024 14:59:26 +0100
Message-ID: <20241223135927.2268815-1-m.niestroj@grinn-global.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=grinn-global.com
Subject: [Buildroot] [PATCH] package/dt-utils: bump to 2023.11.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/dt-utils/dt-utils.hash | 2 +-
 package/dt-utils/dt-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dt-utils/dt-utils.hash b/package/dt-utils/dt-utils.hash
index c57145b835..af964606fe 100644
--- a/package/dt-utils/dt-utils.hash
+++ b/package/dt-utils/dt-utils.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  a6988b889418737324ed3db3785d3a9692e802c1dff4a2323c962008b7b646b1  dt-utils-2023.08.0.tar.xz
+sha256  5a1ace759b37c4b5138738ae0fa03574b1f55da01a0faa88aaff0417d275cc0e  dt-utils-2023.11.0.tar.xz
 sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  LICENSES/CC0-1.0.txt
 sha256  2c9d733cadb50e33cc83f05f1fe7cc4b6c5ff7260fd9eea1b839151c7fa64742  LICENSES/GPL-2.0-only.txt
 sha256  d6e37cb7eff6ef15ae3c4082cf40eae80a94cd59b636991d1149d4a5c9dc3537  LICENSES/GPL-2.0-or-later.txt
diff --git a/package/dt-utils/dt-utils.mk b/package/dt-utils/dt-utils.mk
index 198b36d5fe..7b197c585a 100644
--- a/package/dt-utils/dt-utils.mk
+++ b/package/dt-utils/dt-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DT_UTILS_VERSION = 2023.08.0
+DT_UTILS_VERSION = 2023.11.0
 DT_UTILS_SOURCE = dt-utils-$(DT_UTILS_VERSION).tar.xz
 DT_UTILS_SITE = https://git.pengutronix.de/cgit/tools/dt-utils/snapshot
 DT_UTILS_LICENSE = CC0-1.0, GPL-2.0, GPL-2.0+, Zlib
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
