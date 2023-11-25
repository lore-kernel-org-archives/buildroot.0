Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77881C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 344114188F;
	Mon,  4 Dec 2023 20:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 344114188F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Eh79IcDoZx95; Mon,  4 Dec 2023 20:23:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AEA141860;
	Mon,  4 Dec 2023 20:23:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AEA141860
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 126901BF31D
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C707416DE
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C707416DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fa7xpK2Pfnre for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C5C24172A
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C5C24172A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D57C879B6; Mon,  4 Dec 2023 20:13:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 12:26:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3223987c937c5e7ef2caf0166bb45f4089d89b2f
X-Git-Newrev: 0bfd7351e1970d03ba692a3ab0207aee4a527dbd
X-Patchwork-Hint: ignore
Message-Id: <20231204201328.8D57C879B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyasn1-modules: bump to
 version 0.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0bfd7351e1970d03ba692a3ab0207aee4a527dbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update github url to new repository.

License hash changed due to year update:
https://github.com/pyasn1/pyasn1-modules/commit/848e7d6a6e8c16d68fb7bedd0715f724ef538b5d

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pyasn1-modules/Config.in                  | 2 +-
 package/python-pyasn1-modules/python-pyasn1-modules.hash | 6 +++---
 package/python-pyasn1-modules/python-pyasn1-modules.mk   | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-pyasn1-modules/Config.in b/package/python-pyasn1-modules/Config.in
index 6aff4d935b..cb486d33ae 100644
--- a/package/python-pyasn1-modules/Config.in
+++ b/package/python-pyasn1-modules/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PYTHON_PYASN1_MODULES
 	help
 	  A collection of ASN.1-based protocols modules.
 
-	  https://github.com/etingof/pyasn1-modules
+	  https://github.com/pyasn1/pyasn1-modules
diff --git a/package/python-pyasn1-modules/python-pyasn1-modules.hash b/package/python-pyasn1-modules/python-pyasn1-modules.hash
index 2305596585..6f4bb6faf0 100644
--- a/package/python-pyasn1-modules/python-pyasn1-modules.hash
+++ b/package/python-pyasn1-modules/python-pyasn1-modules.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyasn1-modules/json
-md5  107e1ece7d0a41d782f69f8a95a4d9bc  pyasn1-modules-0.2.8.tar.gz
-sha256  905f84c712230b2c592c19470d3ca8d552de726050d1d1716282a1f6146be65e  pyasn1-modules-0.2.8.tar.gz
+md5  94ee572b06ae09f1903b11333575b091  pyasn1_modules-0.3.0.tar.gz
+sha256  5bd01446b736eb9d31512a30d46c1ac3395d676c6f3cafa4c03eb54b9925631c  pyasn1_modules-0.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256  22c5cc6922ab5d69fba32d8c5ee4cdd14981508cb53afc0ebd85593847fd95a5  LICENSE.txt
+sha256  2aad5fc00f705c4a1addb83eed10a6a75d286a3779f0cf8519d87e62bc4735fd  LICENSE.txt
diff --git a/package/python-pyasn1-modules/python-pyasn1-modules.mk b/package/python-pyasn1-modules/python-pyasn1-modules.mk
index 9933a63aa7..41987028fc 100644
--- a/package/python-pyasn1-modules/python-pyasn1-modules.mk
+++ b/package/python-pyasn1-modules/python-pyasn1-modules.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYASN1_MODULES_VERSION = 0.2.8
-PYTHON_PYASN1_MODULES_SOURCE = pyasn1-modules-$(PYTHON_PYASN1_MODULES_VERSION).tar.gz
-PYTHON_PYASN1_MODULES_SITE = https://files.pythonhosted.org/packages/88/87/72eb9ccf8a58021c542de2588a867dbefc7556e14b2866d1e40e9e2b587e
+PYTHON_PYASN1_MODULES_VERSION = 0.3.0
+PYTHON_PYASN1_MODULES_SOURCE = pyasn1_modules-$(PYTHON_PYASN1_MODULES_VERSION).tar.gz
+PYTHON_PYASN1_MODULES_SITE = https://files.pythonhosted.org/packages/3b/e4/7dec823b1b5603c5b3c51e942d5d9e65efd6ff946e713a325ed4146d070f
 PYTHON_PYASN1_MODULES_SETUP_TYPE = setuptools
 PYTHON_PYASN1_MODULES_LICENSE = BSD-2-Clause
 PYTHON_PYASN1_MODULES_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
