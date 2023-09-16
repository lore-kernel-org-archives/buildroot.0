Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCE6CD37BB
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 13:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EF91832E6;
	Sat, 16 Sep 2023 13:08:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EF91832E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z_XJunIb5KKS; Sat, 16 Sep 2023 13:08:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AF1183529;
	Sat, 16 Sep 2023 13:08:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AF1183529
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 61F091BF861
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 13:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BBDA832E6
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 13:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BBDA832E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id chC5fH--tueN for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 13:08:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 812F2832C9
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 13:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 812F2832C9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 70A18870CF; Sat, 16 Sep 2023 13:08:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 15:07:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0334e49a57484c790fabe8c811d8885008aa0597
X-Git-Newrev: 91984c9ca7dfdf7dcb2e8b93181ade25eb7583a7
X-Patchwork-Hint: ignore
Message-Id: <20230916130818.70A18870CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dbus-fast: bump to version
 2.7.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=91984c9ca7dfdf7dcb2e8b93181ade25eb7583a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
