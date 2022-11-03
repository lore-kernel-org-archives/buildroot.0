Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B383C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0843F60BB6;
	Mon,  5 Dec 2022 11:46:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0843F60BB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s93QOz8l3hNk; Mon,  5 Dec 2022 11:46:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F1B560B30;
	Mon,  5 Dec 2022 11:46:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F1B560B30
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 118331BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDC10405B6
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDC10405B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nehvUJxV6lSM for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2AAC40527
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2AAC40527
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE6A685B9E; Mon,  5 Dec 2022 11:26:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:19:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17475031193133ce70527b70a5530e853069a8f6
X-Git-Newrev: aaf7d09c805c1d4e7b64c96719a3e965f1f16ce7
X-Patchwork-Hint: ignore
Message-Id: <20221205112603.CE6A685B9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-portend: bump to version
 3.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=aaf7d09c805c1d4e7b64c96719a3e965f1f16ce7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to line wrap change:
https://github.com/jaraco/portend/commit/7558cfe2eb2f1ffe3676905e9871466cbc9da24f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-portend/python-portend.hash | 6 +++---
 package/python-portend/python-portend.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-portend/python-portend.hash b/package/python-portend/python-portend.hash
index 1e212b15e5..6af3b77792 100644
--- a/package/python-portend/python-portend.hash
+++ b/package/python-portend/python-portend.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/portend/json
-md5  0ab51a12b7462a5275946a3645a71e92  portend-2.5.tar.gz
-sha256  19dc27bfb3c72471bd30a235a4d5fbefef8a7e31cab367744b5d87a205e7bfd9  portend-2.5.tar.gz
+md5  c37d676837505a6fc8dd33185c6d62a7  portend-3.1.0.tar.gz
+sha256  239e3116045ea823f6df87d6168107ad75ccc0590e37242af0cc1e98c5d224e4  portend-3.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256  a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
+sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-portend/python-portend.mk b/package/python-portend/python-portend.mk
index 8d619052c9..4322121e9b 100644
--- a/package/python-portend/python-portend.mk
+++ b/package/python-portend/python-portend.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PORTEND_VERSION = 2.5
+PYTHON_PORTEND_VERSION = 3.1.0
 PYTHON_PORTEND_SOURCE = portend-$(PYTHON_PORTEND_VERSION).tar.gz
-PYTHON_PORTEND_SITE = https://files.pythonhosted.org/packages/2c/59/948666fc2455ae471efd40cb2a9a990f5f6f2354a9a6b228e29b9fb4a307
+PYTHON_PORTEND_SITE = https://files.pythonhosted.org/packages/6e/0a/42bcc9c97744958ce72d33f526e972379b9e90adede8a151f338818c41d4
 PYTHON_PORTEND_LICENSE = MIT
 PYTHON_PORTEND_LICENSE_FILES = LICENSE
 PYTHON_PORTEND_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
