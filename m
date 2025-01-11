Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439A7C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FF22424D2;
	Fri, 28 Feb 2025 16:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ClvsSJZc2fvn; Fri, 28 Feb 2025 16:34:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C05B642562
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C05B642562;
	Fri, 28 Feb 2025 16:34:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 13988711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B89140413
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XBpT209uVQfU for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 273FB40AED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 273FB40AED
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8264187C72; Fri, 28 Feb 2025 16:30:02 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 16:56:34 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5c16173e69485299b2e79b89cd4a3391b79ab971
X-Git-Newrev: 878dc204f9ff659e7fb3ba441ea84f60d020b347
X-Patchwork-Hint: ignore
Message-Id: <20250228163002.8264187C72@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-asyncclick:
 bump to version 8.1.8
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=878dc204f9ff659e7fb3ba441ea84f60d020b347
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Migrate from setuptools to flit build backend.

License file renamed without content changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-asyncclick/python-asyncclick.hash | 6 +++---
 package/python-asyncclick/python-asyncclick.mk   | 9 ++++-----
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/python-asyncclick/python-asyncclick.hash b/package/python-asyncclick/python-asyncclick.hash
index 59f00893e5..d121097130 100644
--- a/package/python-asyncclick/python-asyncclick.hash
+++ b/package/python-asyncclick/python-asyncclick.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asyncclick/json
-md5  542e83089a55129ca2fe7ccdbc65ba77  asyncclick-8.1.7.2.tar.gz
-sha256  219ea0f29ccdc1bb4ff43bcab7ce0769ac6d48a04f997b43ec6bee99a222daa0  asyncclick-8.1.7.2.tar.gz
+md5  e9bab017b26d1310d42b4043742812ce  asyncclick-8.1.8.tar.gz
+sha256  0f0eb0f280e04919d67cf71b9fcdfb4db2d9ff7203669c40284485c149578e4c  asyncclick-8.1.8.tar.gz
 # Locally computed sha256 checksums
-sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.rst
+sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.txt
diff --git a/package/python-asyncclick/python-asyncclick.mk b/package/python-asyncclick/python-asyncclick.mk
index 946325e496..9168d65b58 100644
--- a/package/python-asyncclick/python-asyncclick.mk
+++ b/package/python-asyncclick/python-asyncclick.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-PYTHON_ASYNCCLICK_VERSION = 8.1.7.2
+PYTHON_ASYNCCLICK_VERSION = 8.1.8
 PYTHON_ASYNCCLICK_SOURCE = asyncclick-$(PYTHON_ASYNCCLICK_VERSION).tar.gz
-PYTHON_ASYNCCLICK_SITE = https://files.pythonhosted.org/packages/5e/bf/59d836c3433d7aa07f76c2b95c4eb763195ea8a5d7f9ad3311ed30c2af61
-PYTHON_ASYNCCLICK_SETUP_TYPE = setuptools
+PYTHON_ASYNCCLICK_SITE = https://files.pythonhosted.org/packages/cb/b5/e1e5fdf1c1bb7e6e614987c120a98d9324bf8edfaa5f5cd16a6235c9d91b
+PYTHON_ASYNCCLICK_SETUP_TYPE = flit
 PYTHON_ASYNCCLICK_LICENSE = BSD-3-Clause
-PYTHON_ASYNCCLICK_LICENSE_FILES = LICENSE.rst
-PYTHON_ASYNCCLICK_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_ASYNCCLICK_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
