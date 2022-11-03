Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC157C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95C4481B53;
	Mon,  5 Dec 2022 11:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95C4481B53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PZF23y23qTBC; Mon,  5 Dec 2022 11:29:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB82D8175B;
	Mon,  5 Dec 2022 11:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB82D8175B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1DB691BF8C7
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BF8D415D6
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BF8D415D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NkqOrXkGuRDZ for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 140FA415E3
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 140FA415E3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10ECC85B9B; Mon,  5 Dec 2022 11:26:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:03:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6263acc00de3ed3187d6c3ba0bf06267d6128646
X-Git-Newrev: 44622611237dd45790d0aebcb652a36f238fd136
X-Patchwork-Hint: ignore
Message-Id: <20221205112601.10ECC85B9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-colorama: bump to version
 0.4.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=44622611237dd45790d0aebcb652a36f238fd136
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate to hatchling pep517 build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-colorama/python-colorama.hash | 4 ++--
 package/python-colorama/python-colorama.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-colorama/python-colorama.hash b/package/python-colorama/python-colorama.hash
index e975a66363..aba1be3eba 100644
--- a/package/python-colorama/python-colorama.hash
+++ b/package/python-colorama/python-colorama.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/colorama/json
-md5  57b22f2597f63df051b69906fbf310cc  colorama-0.4.4.tar.gz
-sha256  5941b2b48a20143d2267e95b1c2a7603ce057ee39fd88e7329b0c292aa16869b  colorama-0.4.4.tar.gz
+md5  11fe1cbf8299798551ac88f824ea11c4  colorama-0.4.6.tar.gz
+sha256  08695f5cb7ed6e0531a20572697297273c47b8cae5a63ffc6d6ed5c201be6e44  colorama-0.4.6.tar.gz
 # Locally computed sha256 checksums
 sha256  cac35c02686e5d04a5a7140bfb3b36e73aed496656e891102e428886d7930318  LICENSE.txt
diff --git a/package/python-colorama/python-colorama.mk b/package/python-colorama/python-colorama.mk
index d3d29a63e9..d633e00602 100644
--- a/package/python-colorama/python-colorama.mk
+++ b/package/python-colorama/python-colorama.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_COLORAMA_VERSION = 0.4.4
+PYTHON_COLORAMA_VERSION = 0.4.6
 PYTHON_COLORAMA_SOURCE = colorama-$(PYTHON_COLORAMA_VERSION).tar.gz
-PYTHON_COLORAMA_SITE = https://files.pythonhosted.org/packages/1f/bb/5d3246097ab77fa083a61bd8d3d527b7ae063c7d8e8671b1cf8c4ec10cbe
-PYTHON_COLORAMA_SETUP_TYPE = setuptools
+PYTHON_COLORAMA_SITE = https://files.pythonhosted.org/packages/d8/53/6f443c9a4a8358a93a6792e2acffb9d9d5cb0a5cfd8802644b7b1c9a02e4
+PYTHON_COLORAMA_SETUP_TYPE = pep517
 PYTHON_COLORAMA_LICENSE = BSD-3-Clause
 PYTHON_COLORAMA_LICENSE_FILES = LICENSE.txt
+PYTHON_COLORAMA_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
