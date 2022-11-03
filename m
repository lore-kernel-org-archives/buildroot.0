Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A907C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 20:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 197EF4185F;
	Thu,  3 Nov 2022 20:56:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 197EF4185F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rq9pEIDHaNX6; Thu,  3 Nov 2022 20:56:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E65524185A;
	Thu,  3 Nov 2022 20:56:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E65524185A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E8DB21BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9C0F81F72
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9C0F81F72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ITHXDrj1yWP3 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BD5081EFA
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BD5081EFA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 392E187BCC; Thu,  3 Nov 2022 20:55:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:03:06 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2551d48664d1f4feb53e1fda1e75f40524df438b
X-Git-Newrev: 1a408394f24fde34fb7fdf99f69865699b2f11b1
X-Patchwork-Hint: ignore
Message-Id: <20221103205510.392E187BCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-aioprocessing:
 bump to version 2.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a408394f24fde34fb7fdf99f69865699b2f11b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Migrate from setuptools to flit build system.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aioprocessing/python-aioprocessing.hash | 4 ++--
 package/python-aioprocessing/python-aioprocessing.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aioprocessing/python-aioprocessing.hash b/package/python-aioprocessing/python-aioprocessing.hash
index cf92a72d4a..8913a7abb0 100644
--- a/package/python-aioprocessing/python-aioprocessing.hash
+++ b/package/python-aioprocessing/python-aioprocessing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioprocessing/json
-md5  838b6aa073f1373bd42204f86b0e3196  aioprocessing-2.0.0.tar.gz
-sha256  469dfb746e8c4e0c727ba135cfabf9e034c554f6a73c27f908bfe3625dd74b9e  aioprocessing-2.0.0.tar.gz
+md5  e533c65f5879374c27f266c2040405ea  aioprocessing-2.0.1.tar.gz
+sha256  fe01c7b1a38c78168611d3040e73d93036c3b7c8a649d636dc9ed7a3bc9b1ba2  aioprocessing-2.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  53c809e8f0b91a68a39477e5fbdf77fe2b74dd6a1647c2dd9b7b22fed135239e  LICENSE.txt
diff --git a/package/python-aioprocessing/python-aioprocessing.mk b/package/python-aioprocessing/python-aioprocessing.mk
index e1e919de2d..6cd59ab599 100644
--- a/package/python-aioprocessing/python-aioprocessing.mk
+++ b/package/python-aioprocessing/python-aioprocessing.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_AIOPROCESSING_VERSION = 2.0.0
+PYTHON_AIOPROCESSING_VERSION = 2.0.1
 PYTHON_AIOPROCESSING_SOURCE = aioprocessing-$(PYTHON_AIOPROCESSING_VERSION).tar.gz
-PYTHON_AIOPROCESSING_SITE = https://files.pythonhosted.org/packages/8e/3e/54266241660fb026bfd27f660d44cd81a4b7f8a145d8e2db010de12622a0
-PYTHON_AIOPROCESSING_SETUP_TYPE = setuptools
+PYTHON_AIOPROCESSING_SITE = https://files.pythonhosted.org/packages/4d/85/9a75151e7049bf144c01384279201d82d99484bd658f8e6fb013552d8724
+PYTHON_AIOPROCESSING_SETUP_TYPE = flit
 PYTHON_AIOPROCESSING_LICENSE = BSD-2-Clause
 PYTHON_AIOPROCESSING_LICENSE_FILES = LICENSE.txt
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
