Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D5DC5B552
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 11:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B2CA61221;
	Mon,  9 Jun 2025 11:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id low2v4HDzxqB; Mon,  9 Jun 2025 11:07:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E47160DE1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E47160DE1;
	Mon,  9 Jun 2025 11:07:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 016111F2
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 11:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBD5B6089D
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 11:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XNKwKlZYrcpf for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 11:07:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=77.55.128.204;
 helo=mail.grinn-global.com; envelope-from=m.niestroj@grinn-global.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D680B60DE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D680B60DE1
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D680B60DE1
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 11:07:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (9)
Received: from zm.int.grinn-global.com (pub-196.163.106.212.multiplay.pl
 [212.106.163.196])
 by server220076.nazwa.pl (Postfix) with ESMTP id 845D71BD8D4;
 Mon, 09 Jun 2025 12:56:02 +0200 (CEST)
From: Marcin Niestroj <m.niestroj@grinn-global.com>
To: buildroot@buildroot.org
Date: Mon,  9 Jun 2025 12:55:54 +0200
Message-ID: <20250609105555.1253825-1-m.niestroj@grinn-global.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=grinn-global.com
Subject: [Buildroot] [PATCH] package/python-iniconfig: bump to 2.1.0
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

[1] https://github.com/pytest-dev/iniconfig/blob/main/CHANGELOG

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/python-iniconfig/python-iniconfig.hash | 4 ++--
 package/python-iniconfig/python-iniconfig.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-iniconfig/python-iniconfig.hash b/package/python-iniconfig/python-iniconfig.hash
index 541ae3e3f3..d3e85267f4 100644
--- a/package/python-iniconfig/python-iniconfig.hash
+++ b/package/python-iniconfig/python-iniconfig.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/iniconfig/json
-md5  3c030b3f51dcc3aca585de05635600e4  iniconfig-2.0.0.tar.gz
-sha256  2d91e135bf72d31a410b17c16da610a82cb55f6b0477d1a902134b24a455b8b3  iniconfig-2.0.0.tar.gz
+md5  437ede5b20b0ab2e76ca08f02b5c49dd  iniconfig-2.1.0.tar.gz
+sha256  3abbd2e30b36733fee78f9c7f7308f2d0050e88f0087fd25c2645f63c773e1c7  iniconfig-2.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  2af680c39ef493fb82830356d1d3df1acb5a06033cba2dec7a19e21caa77a866  LICENSE
diff --git a/package/python-iniconfig/python-iniconfig.mk b/package/python-iniconfig/python-iniconfig.mk
index 7c6cd14907..3276032fd3 100644
--- a/package/python-iniconfig/python-iniconfig.mk
+++ b/package/python-iniconfig/python-iniconfig.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INICONFIG_VERSION = 2.0.0
+PYTHON_INICONFIG_VERSION = 2.1.0
 PYTHON_INICONFIG_SOURCE = iniconfig-$(PYTHON_INICONFIG_VERSION).tar.gz
-PYTHON_INICONFIG_SITE = https://files.pythonhosted.org/packages/d7/4b/cbd8e699e64a6f16ca3a8220661b5f83792b3017d0f79807cb8708d33913
+PYTHON_INICONFIG_SITE = https://files.pythonhosted.org/packages/f2/97/ebf4da567aa6827c909642694d71c9fcf53e5b504f2d96afea02718862f3
 PYTHON_INICONFIG_SETUP_TYPE = hatch
 PYTHON_INICONFIG_LICENSE = MIT
 PYTHON_INICONFIG_LICENSE_FILES = LICENSE
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
