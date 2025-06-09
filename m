Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5468CC61CE8
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 11:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B2D981656;
	Mon,  9 Jun 2025 11:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IWS3Qds08l1R; Mon,  9 Jun 2025 11:06:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5301781567
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5301781567;
	Mon,  9 Jun 2025 11:06:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C47751F2
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 11:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B619D41239
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 11:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a6IB-ky86bEh for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 11:06:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=77.55.128.204;
 helo=mail.grinn-global.com; envelope-from=m.niestroj@grinn-global.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 56A8241829
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56A8241829
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56A8241829
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 11:05:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (27)
Received: from zm.int.grinn-global.com (pub-196.163.106.212.multiplay.pl
 [212.106.163.196])
 by server220076.nazwa.pl (Postfix) with ESMTP id B8AAB1BDE88;
 Mon, 09 Jun 2025 12:56:25 +0200 (CEST)
From: Marcin Niestroj <m.niestroj@grinn-global.com>
To: buildroot@buildroot.org
Date: Mon,  9 Jun 2025 12:56:22 +0200
Message-ID: <20250609105623.1267146-1-m.niestroj@grinn-global.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=grinn-global.com
Subject: [Buildroot] [PATCH] package/python-pluggy: bump to 1.6.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See [1] for changelog.

[1] https://github.com/pytest-dev/pluggy/blob/main/CHANGELOG.rst#pluggy-160-2025-05-15

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/python-pluggy/python-pluggy.hash | 4 ++--
 package/python-pluggy/python-pluggy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pluggy/python-pluggy.hash b/package/python-pluggy/python-pluggy.hash
index 522c1e3b6c..94a20accf1 100644
--- a/package/python-pluggy/python-pluggy.hash
+++ b/package/python-pluggy/python-pluggy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pluggy/json
-md5  ac0870be78ba0ee227a5c3955efeba59  pluggy-1.5.0.tar.gz
-sha256  2cffa88e94fdc978c4c574f15f9e59b7f4201d439195c3715ca9e2486f1d0cf1  pluggy-1.5.0.tar.gz
+md5  54391218af778acb006c2d915085d469  pluggy-1.6.0.tar.gz
+sha256  7dcc130b76258d33b90f61b658791dede3486c3e6bfb003ee5c9bfb396dd22f3  pluggy-1.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  d6b65e6c213a5d0b577911d34d6e5949b9f59d76c238c5071a2f3fc16cfb2606  LICENSE
diff --git a/package/python-pluggy/python-pluggy.mk b/package/python-pluggy/python-pluggy.mk
index f8a0b729b5..a5d8f5e94b 100644
--- a/package/python-pluggy/python-pluggy.mk
+++ b/package/python-pluggy/python-pluggy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLUGGY_VERSION = 1.5.0
+PYTHON_PLUGGY_VERSION = 1.6.0
 PYTHON_PLUGGY_SOURCE = pluggy-$(PYTHON_PLUGGY_VERSION).tar.gz
-PYTHON_PLUGGY_SITE = https://files.pythonhosted.org/packages/96/2d/02d4312c973c6050a18b314a5ad0b3210edb65a906f868e31c111dede4a6
+PYTHON_PLUGGY_SITE = https://files.pythonhosted.org/packages/f9/e2/3e91f31a7d2b083fe6ef3fa267035b518369d9511ffab804f839851d2779
 PYTHON_PLUGGY_SETUP_TYPE = setuptools
 PYTHON_PLUGGY_LICENSE = MIT
 PYTHON_PLUGGY_LICENSE_FILES = LICENSE
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
