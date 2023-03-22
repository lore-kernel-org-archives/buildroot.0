Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D15C6FD1F
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 22:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5D4D8407E;
	Wed, 22 Mar 2023 22:47:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5D4D8407E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BbtsQVsHv6iG; Wed, 22 Mar 2023 22:47:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2248781350;
	Wed, 22 Mar 2023 22:47:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2248781350
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 05EAA1BF909
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 22:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B76AF41C78
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 22:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B76AF41C78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yTEhwRzotP-p for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 22:44:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDF5F41C87
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 22:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDF5F41C87
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF57A87589; Wed, 22 Mar 2023 22:44:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Mar 2023 23:43:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f345271e43256d3c75f0a1144184266e29d5dae4
X-Git-Newrev: 2bd5301db0a5f30e863ebcb146d63653848f13e1
X-Patchwork-Hint: ignore
Message-Id: <20230322224400.BF57A87589@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bsdiff4: bump to version
 1.2.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=2bd5301db0a5f30e863ebcb146d63653848f13e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-bsdiff4/python-bsdiff4.hash | 4 ++--
 package/python-bsdiff4/python-bsdiff4.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bsdiff4/python-bsdiff4.hash b/package/python-bsdiff4/python-bsdiff4.hash
index bb84bb09a5..f053922ac0 100644
--- a/package/python-bsdiff4/python-bsdiff4.hash
+++ b/package/python-bsdiff4/python-bsdiff4.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bsdiff4/json
-md5  fc5ea1adfe629a7c7ac6f4bb1a0dca93  bsdiff4-1.2.2.tar.gz
-sha256  1880ac3f52a6c46ae6bcc6db117e4fb35f9b0ccd5af75fd4fee6907d00d6983c  bsdiff4-1.2.2.tar.gz
+md5  67cf87c5d66fe389949a314849f68863  bsdiff4-1.2.3.tar.gz
+sha256  1b95ce93b9f306846f6c91c9d0e3eb6590a4c85ac2bbe72b5f60d9db82ad2a1c  bsdiff4-1.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256  c6c921c90383f1c43beb53c49a652d28309a410a7c394c729fd8870271451cf0  LICENSE
diff --git a/package/python-bsdiff4/python-bsdiff4.mk b/package/python-bsdiff4/python-bsdiff4.mk
index 7a50e3379a..05fe1bef25 100644
--- a/package/python-bsdiff4/python-bsdiff4.mk
+++ b/package/python-bsdiff4/python-bsdiff4.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BSDIFF4_VERSION = 1.2.2
+PYTHON_BSDIFF4_VERSION = 1.2.3
 PYTHON_BSDIFF4_SOURCE = bsdiff4-$(PYTHON_BSDIFF4_VERSION).tar.gz
-PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/34/e2/e28dd282974f919a6b9adb3b7e64bb1fa4390046706c3e58a60b94aeb497
+PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/a8/0e/a677b62d35e3a9d074eafb5b16b569d5d6870a6ead02e8c830e4d4e73db7
 PYTHON_BSDIFF4_LICENSE = BSD-2-Clause, BSD-Protection (core.c)
 PYTHON_BSDIFF4_LICENSE_FILES = LICENSE
 PYTHON_BSDIFF4_CPE_ID_VENDOR = pypi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
