Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41678C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E32834209D;
	Mon,  6 Nov 2023 22:24:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E32834209D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UDD5Iht6rjmN; Mon,  6 Nov 2023 22:24:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DC694209C;
	Mon,  6 Nov 2023 22:23:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DC694209C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4DC5D1BF951
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 090A661286
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 090A661286
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vk0lycmTa7iJ for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:20:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F569612CA
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F569612CA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0002D86B7B; Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 23:15:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 30f9edb676f06deeee8ae3484c0d3998d7dddc7f
X-Git-Newrev: c45daefb832ae9f6d5c7d9aad2dc85c43b593fdc
X-Patchwork-Hint: ignore
Message-Id: <20231106222018.0002D86B7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ipython: bump to version
 8.17.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c45daefb832ae9f6d5c7d9aad2dc85c43b593fdc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer applicable CVE-2023-24816 ignore.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-ipython/python-ipython.hash | 4 ++--
 package/python-ipython/python-ipython.mk   | 6 ++----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index f11ad1e18c..f68b3ba78c 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/ipython/json
-md5  a1ea9b6e43c5568e5031974eb3a6acb0  ipython-8.8.0.tar.gz
-sha256  f3bf2c08505ad2c3f4ed5c46ae0331a8547d36bf4b21a451e8ae80c0791db95b  ipython-8.8.0.tar.gz
+md5  ac2ff5bad97aa09befdf7f0f27323699  ipython-8.17.2.tar.gz
+sha256  126bb57e1895594bb0d91ea3090bbd39384f6fe87c3d57fd558d0670f50339bb  ipython-8.17.2.tar.gz
 # Locally computed sha256 checksums
 sha256  341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b30670f043df17  COPYING.rst
 sha256  e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb  LICENSE
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index aa274314eb..1335121688 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 8.8.0
+PYTHON_IPYTHON_VERSION = 8.17.2
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/f5/39/89664d8c3e4dfb0a73862cbbff8eb4028a1e3d4305da80ab0a493848ed9b
+PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/a9/e9/c83d1a5756bf44f1802045a54dacc910d3d254c5ec56040993978d8c1b8d
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_CPE_ID_VENDOR = ipython
 PYTHON_IPYTHON_CPE_ID_PRODUCT = ipython
-# Affects only Windows. Can be dropped once we update to >= 8.10.0
-PYTHON_IPYTHON_IGNORE_CVES += CVE-2023-24816
 PYTHON_IPYTHON_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
