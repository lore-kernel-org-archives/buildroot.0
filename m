Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A873EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 22 Jun 2023 05:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23CEB83B11;
	Thu, 22 Jun 2023 05:36:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23CEB83B11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KmgDFZChilkl; Thu, 22 Jun 2023 05:36:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5333A83B20;
	Thu, 22 Jun 2023 05:36:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5333A83B20
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1709B1BF288
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 05:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3F1F41F93
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 05:36:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3F1F41F93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b_glDCC5oq5x for <buildroot@lists.busybox.net>;
 Thu, 22 Jun 2023 05:36:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C318341E80
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C318341E80
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 05:36:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (21)
Received: from zm.lan (pub-44.182.29.194.multiplay.pl [194.29.182.44])
 by server220076.nazwa.pl (Postfix) with ESMTP id 90A1E1BC136;
 Thu, 22 Jun 2023 07:36:23 +0200 (CEST)
From: Marcin Niestroj <m.niestroj@grinn-global.com>
To: buildroot@buildroot.org
Date: Thu, 22 Jun 2023 07:36:18 +0200
Message-Id: <20230622053618.3230837-2-m.niestroj@grinn-global.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230622053618.3230837-1-m.niestroj@grinn-global.com>
References: <20230622053618.3230837-1-m.niestroj@grinn-global.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-dbus-fast: bump to version
 1.86.0
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
 package/python-dbus-fast/python-dbus-fast.hash | 4 ++--
 package/python-dbus-fast/python-dbus-fast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dbus-fast/python-dbus-fast.hash b/package/python-dbus-fast/python-dbus-fast.hash
index e9a3992f8e..dce258c0f9 100644
--- a/package/python-dbus-fast/python-dbus-fast.hash
+++ b/package/python-dbus-fast/python-dbus-fast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dbus-fast/json
-md5  21e3675168e3dbe807c6c8a29267241f  dbus_fast-1.84.0.tar.gz
-sha256  d64f1b68c1c81268e846471caeb9264a9306a6c6ad356c30d5cdf7d1ecc251a1  dbus_fast-1.84.0.tar.gz
+md5  1fc61ba29ed79162c651be4bae4a9dee  dbus_fast-1.86.0.tar.gz
+sha256  ca376a360f1bc2c3d59e9edfb5e4de5be389cca37e8c92f4539176ddf755341e  dbus_fast-1.86.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  LICENSE
diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index 9dd88f613f..1456d5600d 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DBUS_FAST_VERSION = 1.84.0
+PYTHON_DBUS_FAST_VERSION = 1.86.0
 PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
-PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/81/67/a83522d6692a72911c3586e2fcd2363ce22d1522a7e17e1012f255a6083b
+PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/08/9d/ad27f451198724d6e5b4f0435a13f2b2f839716bbcdede2ccf6d99743ec5
 PYTHON_DBUS_FAST_SETUP_TYPE = setuptools
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
