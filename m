Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C4FC433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 20:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B2F681C38;
	Wed, 20 Apr 2022 20:44:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hhV_TR7VOuvE; Wed, 20 Apr 2022 20:44:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81F8B81B99;
	Wed, 20 Apr 2022 20:44:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 912391C1135
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 20:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D47160E69
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 20:42:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ml-W7b6sQY93 for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 20:42:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB37561152
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 20:42:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B658683F5A; Wed, 20 Apr 2022 20:32:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 22:37:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: daf331b3afac908e0d7949e55659182810dbbf1c
X-Git-Newrev: 19e0d88dca22c81fdbb08de405ce80f9e9f69ea0
X-Patchwork-Hint: ignore
Message-Id: <20220420203211.B658683F5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bsdiff4: bump to version
 1.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=19e0d88dca22c81fdbb08de405ce80f9e9f69ea0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate build system from distutils to setuptools.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-bsdiff4/python-bsdiff4.hash | 6 +++---
 package/python-bsdiff4/python-bsdiff4.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-bsdiff4/python-bsdiff4.hash b/package/python-bsdiff4/python-bsdiff4.hash
index 4fddd137e6..bb84bb09a5 100644
--- a/package/python-bsdiff4/python-bsdiff4.hash
+++ b/package/python-bsdiff4/python-bsdiff4.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bsdiff4/json
-md5  58889a1cd439c82c78aa2e4776b1ff38  bsdiff4-1.2.1.tar.gz
-sha256  87cffc7522effdda03fd1564b212ad2279c0af50d16c3e65776f80acb6705d4b  bsdiff4-1.2.1.tar.gz
-# Locally computed sha256
+md5  fc5ea1adfe629a7c7ac6f4bb1a0dca93  bsdiff4-1.2.2.tar.gz
+sha256  1880ac3f52a6c46ae6bcc6db117e4fb35f9b0ccd5af75fd4fee6907d00d6983c  bsdiff4-1.2.2.tar.gz
+# Locally computed sha256 checksums
 sha256  c6c921c90383f1c43beb53c49a652d28309a410a7c394c729fd8870271451cf0  LICENSE
diff --git a/package/python-bsdiff4/python-bsdiff4.mk b/package/python-bsdiff4/python-bsdiff4.mk
index e1c3f7765b..7a50e3379a 100644
--- a/package/python-bsdiff4/python-bsdiff4.mk
+++ b/package/python-bsdiff4/python-bsdiff4.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-PYTHON_BSDIFF4_VERSION = 1.2.1
+PYTHON_BSDIFF4_VERSION = 1.2.2
 PYTHON_BSDIFF4_SOURCE = bsdiff4-$(PYTHON_BSDIFF4_VERSION).tar.gz
-PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/d8/97/101315b0d8c8d6340ee310484a1af6a2ccf65d7bb4762c3a669cf9457c71
+PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/34/e2/e28dd282974f919a6b9adb3b7e64bb1fa4390046706c3e58a60b94aeb497
 PYTHON_BSDIFF4_LICENSE = BSD-2-Clause, BSD-Protection (core.c)
 PYTHON_BSDIFF4_LICENSE_FILES = LICENSE
 PYTHON_BSDIFF4_CPE_ID_VENDOR = pypi
 PYTHON_BSDIFF4_CPE_ID_PRODUCT = bsdiff4
-PYTHON_BSDIFF4_SETUP_TYPE = distutils
+PYTHON_BSDIFF4_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
