Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF73C4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 22:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7498681A50;
	Mon,  7 Nov 2022 22:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7498681A50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sjDjz-gnptet; Mon,  7 Nov 2022 22:18:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E338819B8;
	Mon,  7 Nov 2022 22:18:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E338819B8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BF381BF954
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCA8B81403
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:17:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCA8B81403
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1cC9D-dDUXFa for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 22:17:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE439819F3
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 22:17:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE439819F3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB71188168; Mon,  7 Nov 2022 22:17:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Nov 2022 23:16:53 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9afa3e3c7d073643c325a948358550caf9a6f8f3
X-Git-Newrev: 892e1debdff900dc29af853f23746d01b118eeb0
X-Patchwork-Hint: ignore
Message-Id: <20221107221713.EB71188168@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-spidev: bump to
 version 3.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=892e1debdff900dc29af853f23746d01b118eeb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License moved out of readme, verified as still MIT.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-spidev/python-spidev.hash | 10 +++++-----
 package/python-spidev/python-spidev.mk   |  6 +++---
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/python-spidev/python-spidev.hash b/package/python-spidev/python-spidev.hash
index c74d7c470c..cd8a24eb72 100644
--- a/package/python-spidev/python-spidev.hash
+++ b/package/python-spidev/python-spidev.hash
@@ -1,5 +1,5 @@
-# sha256 from https://pypi.org/project/spidev
-sha256  8a7f5c289f161ea2ac4697fa8a10918232c990678dd0053084b3c43b1363910d  spidev-3.5.tar.gz
-
-# locally computed
-sha256  153a6f02f41aebe292cf3307f973a80b4fb0c988d8d3e7d126c7a66c20b1cc27  README.md
+# md5, sha256 from https://pypi.org/pypi/spidev/json
+md5  83a73279d6e823a9030c4315577bfae3  spidev-3.6.tar.gz
+sha256  14dbc37594a4aaef85403ab617985d3c3ef464d62bc9b769ef552db53701115b  spidev-3.6.tar.gz
+# Locally computed sha256 checksums
+sha256  510129bc8174c0fa81fa6d653691d1bd5d3555f7f38979ec45b5fc5bbff5377b  LICENSE
diff --git a/package/python-spidev/python-spidev.mk b/package/python-spidev/python-spidev.mk
index e1065610a7..f48b5b0832 100644
--- a/package/python-spidev/python-spidev.mk
+++ b/package/python-spidev/python-spidev.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_SPIDEV_VERSION = 3.5
+PYTHON_SPIDEV_VERSION = 3.6
 PYTHON_SPIDEV_SOURCE = spidev-$(PYTHON_SPIDEV_VERSION).tar.gz
-PYTHON_SPIDEV_SITE = https://files.pythonhosted.org/packages/62/56/de649e7d95f9fcfaf965a6eb937b4a46bc77ef21487c99cde1a7a0546040
+PYTHON_SPIDEV_SITE = https://files.pythonhosted.org/packages/c7/d9/401c0a7be089e02826cf2c201f489876b601f15be100fe391ef9c2faed83
 PYTHON_SPIDEV_SETUP_TYPE = setuptools
 PYTHON_SPIDEV_LICENSE = MIT
-PYTHON_SPIDEV_LICENSE_FILES = README.md
+PYTHON_SPIDEV_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
