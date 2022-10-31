Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A197FA3741
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 14:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2863381A99;
	Mon, 31 Oct 2022 14:40:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2863381A99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I1rEGrueHqmZ; Mon, 31 Oct 2022 14:40:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0254281A39;
	Mon, 31 Oct 2022 14:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0254281A39
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 93E271BF3D7
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 14:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6543441570
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 14:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6543441570
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0rxKL2lhKT04 for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 14:40:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2481741605
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 14:40:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2481741605
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A8D987949; Mon, 31 Oct 2022 14:40:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 15:39:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1227e4e7202adcb0b73760584bf8383aa65bc0cf
X-Git-Newrev: d187743f3d80a7f3022f2559d5f5c7f8e0adc634
X-Patchwork-Hint: ignore
Message-Id: <20221031144042.0A8D987949@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setuptools: bump to version
 65.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d187743f3d80a7f3022f2559d5f5c7f8e0adc634
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index 3f68084068..2592fc201c 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,4 +1,4 @@
 # From https://pypi.org/pypi/setuptools/json
-md5  66c6b8819c5306c12c38d7fad41b7f99  setuptools-65.3.0.tar.gz
-sha256  7732871f4f7fa58fb6bdcaeadb0161b2bd046c85905dbaa066bdcbcc81953b57  setuptools-65.3.0.tar.gz
+md5  9018a18990e7c16159ec3972affba76c  setuptools-65.5.0.tar.gz
+sha256  512e5536220e38146176efb833d4a62aa726b7bbff82cfbc8ba9eaa3996e0b17  setuptools-65.5.0.tar.gz
 sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index b7483c6347..9dc0a6a38b 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 65.3.0
+PYTHON_SETUPTOOLS_VERSION = 65.5.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/cc/83/7ea9d9b3a6ff3225aca2fce5e4df373bee7e0a74c539711a4fbfda53374f
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/c5/41/247814d8b7a044717164c74080725a6c8f3d2b5fc82b34bd825b617df663
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
