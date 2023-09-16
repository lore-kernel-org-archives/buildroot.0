Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165C2CD37B1
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 05:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C16B9408C3;
	Sat, 16 Sep 2023 05:00:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C16B9408C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n32odkpgsDZ9; Sat, 16 Sep 2023 05:00:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F047402E0;
	Sat, 16 Sep 2023 05:00:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F047402E0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A14C11BF352
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 05:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 883CC83BF8
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 05:00:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 883CC83BF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kYUcCpbHJkwh for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 05:00:26 +0000 (UTC)
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99DF683BF7
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 05:00:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99DF683BF7
X-Virus-Scanned: by amavisd-new using ClamAV (30)
Received: from zm.lan (pub-46.182.29.194.multiplay.pl [194.29.182.46])
 by server220076.nazwa.pl (Postfix) with ESMTP id 348211BBEAC;
 Sat, 16 Sep 2023 07:00:24 +0200 (CEST)
From: Marcin Niestroj <m.niestroj@grinn-global.com>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 07:00:21 +0200
Message-ID: <20230916050022.1364264-1-m.niestroj@grinn-global.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-dbus-next: bump to version 2.7.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/python-dbus-fast/python-dbus-fast.hash | 4 ++--
 package/python-dbus-fast/python-dbus-fast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dbus-fast/python-dbus-fast.hash b/package/python-dbus-fast/python-dbus-fast.hash
index dce258c0f9..83382bfb29 100644
--- a/package/python-dbus-fast/python-dbus-fast.hash
+++ b/package/python-dbus-fast/python-dbus-fast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dbus-fast/json
-md5  1fc61ba29ed79162c651be4bae4a9dee  dbus_fast-1.86.0.tar.gz
-sha256  ca376a360f1bc2c3d59e9edfb5e4de5be389cca37e8c92f4539176ddf755341e  dbus_fast-1.86.0.tar.gz
+md5  810a5b08cc14e269207efa9cb651e86b  dbus_fast-2.7.0.tar.gz
+sha256  9110c689fea4869647ebad3cd80317554c9f77e3825eed2e36f4cb9aec749761  dbus_fast-2.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  LICENSE
diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index 1456d5600d..737406c9ab 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DBUS_FAST_VERSION = 1.86.0
+PYTHON_DBUS_FAST_VERSION = 2.7.0
 PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
-PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/08/9d/ad27f451198724d6e5b4f0435a13f2b2f839716bbcdede2ccf6d99743ec5
+PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/e5/ba/beeaf36821f0164a208e8cbe9adbdc75ce0a6eafdebd4011912a806a4275
 PYTHON_DBUS_FAST_SETUP_TYPE = setuptools
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
