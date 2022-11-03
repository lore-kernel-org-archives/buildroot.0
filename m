Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFF9C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 20:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BDC94185C;
	Thu,  3 Nov 2022 20:56:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BDC94185C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EByEx5MjZfc8; Thu,  3 Nov 2022 20:56:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0CE941858;
	Thu,  3 Nov 2022 20:56:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0CE941858
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D86F1BF968
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0B01409E6
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0B01409E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 46WCTC1hmNvm for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED1F64157A
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED1F64157A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DBFEA87BCE; Thu,  3 Nov 2022 20:55:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:03:29 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6263acc00de3ed3187d6c3ba0bf06267d6128646
X-Git-Newrev: 44622611237dd45790d0aebcb652a36f238fd136
X-Patchwork-Hint: ignore
Message-Id: <20221103205510.DBFEA87BCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-colorama: bump
 to version 0.4.6
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
