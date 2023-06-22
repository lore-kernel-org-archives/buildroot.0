Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0128EB64D8
	for <buildroot@archiver.kernel.org>; Thu, 22 Jun 2023 05:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5516883B0C;
	Thu, 22 Jun 2023 05:21:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5516883B0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jcR1bnYxoyZT; Thu, 22 Jun 2023 05:21:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9297283A8F;
	Thu, 22 Jun 2023 05:21:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9297283A8F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F8351BF288
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 05:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A0C183A8C
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 05:21:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A0C183A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fvOHcf7Bqd1P for <buildroot@lists.busybox.net>;
 Thu, 22 Jun 2023 05:21:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33A7283A8F
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33A7283A8F
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 05:21:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (22)
Received: from zm.lan (pub-44.182.29.194.multiplay.pl [194.29.182.44])
 by server220076.nazwa.pl (Postfix) with ESMTP id 102CF1BBDD2;
 Thu, 22 Jun 2023 07:10:56 +0200 (CEST)
From: Marcin Niestroj <m.niestroj@grinn-global.com>
To: buildroot@buildroot.org
Date: Thu, 22 Jun 2023 07:10:47 +0200
Message-Id: <20230622051047.2907590-1-m.niestroj@grinn-global.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-bleak: bump to version 0.20.2
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/python-bleak/python-bleak.hash | 4 ++--
 package/python-bleak/python-bleak.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bleak/python-bleak.hash b/package/python-bleak/python-bleak.hash
index 2cd038cb68..aae230dac2 100644
--- a/package/python-bleak/python-bleak.hash
+++ b/package/python-bleak/python-bleak.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bleak/json
-md5  6f9881cc85648683927ab0b9c58a1a52  bleak-0.20.0.tar.gz
-sha256  7f6fe69454ad5d4c0ab05ae4a9aa1aabd6926d7128eab2fac4ef8a58a72999ee  bleak-0.20.0.tar.gz
+md5  97e2987748f1def21e1910a258027c17  bleak-0.20.2.tar.gz
+sha256  6c92a47abe34e6dea8ffc5cea9457cbff6e1be966854839dbc25cddb36b79ee4  bleak-0.20.2.tar.gz
 # Locally computed sha256 checksums
 sha256  c4029a2b63b3824ab68be841f414addbdde20cb79cdbe272fa80c0b2abe65374  LICENSE
diff --git a/package/python-bleak/python-bleak.mk b/package/python-bleak/python-bleak.mk
index 7d3dc2831f..9532774ae8 100644
--- a/package/python-bleak/python-bleak.mk
+++ b/package/python-bleak/python-bleak.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BLEAK_VERSION = 0.20.0
+PYTHON_BLEAK_VERSION = 0.20.2
 PYTHON_BLEAK_SOURCE = bleak-$(PYTHON_BLEAK_VERSION).tar.gz
-PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/aa/86/5084561ed4f31aec0322bef015db949a9f2bf0b4f6bd72b16479cf03f459
+PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/87/95/a6f614fae12a6fe1cf517f8600004dd6abd4af0e0e1177c03164d0637e81
 PYTHON_BLEAK_SETUP_TYPE = setuptools
 PYTHON_BLEAK_LICENSE = MIT
 PYTHON_BLEAK_LICENSE_FILES = LICENSE
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
