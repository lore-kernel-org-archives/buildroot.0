Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20B8C46467
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 11:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A336081FE8;
	Sun, 15 Jan 2023 11:10:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A336081FE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 27GWHJU69-_t; Sun, 15 Jan 2023 11:10:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB8CF81F1A;
	Sun, 15 Jan 2023 11:10:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB8CF81F1A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 102431BF29F
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 724A481F1A
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 724A481F1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QAXJphX_MbDd for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 11:06:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 724EB81FE8
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 11:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 724EB81FE8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 704E1870BF; Sun, 15 Jan 2023 11:06:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 12:01:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d88b18fd42fceb375339c7255cc1d07f755f85c
X-Git-Newrev: c20f5be37a14fb32e4382a37a4cb79eddd0f06e4
X-Patchwork-Hint: ignore
Message-Id: <20230115110628.704E1870BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-keyring: bump to version
 23.13.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=c20f5be37a14fb32e4382a37a4cb79eddd0f06e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-keyring/python-keyring.hash | 4 ++--
 package/python-keyring/python-keyring.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-keyring/python-keyring.hash b/package/python-keyring/python-keyring.hash
index 791ee6563b..837743f5c2 100644
--- a/package/python-keyring/python-keyring.hash
+++ b/package/python-keyring/python-keyring.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/keyring/json
-md5  edf0645c28f16884e2b121b2c51e0770  keyring-23.11.0.tar.gz
-sha256  ad192263e2cdd5f12875dedc2da13534359a7e760e77f8d04b50968a821c2361  keyring-23.11.0.tar.gz
+md5  a0640ab7525b4fe58061b5999cca5026  keyring-23.13.1.tar.gz
+sha256  ba2e15a9b35e21908d0aaf4e0a47acc52d6ae33444df0da2b49d41a46ef6d678  keyring-23.13.1.tar.gz
 # Locally computed sha256 checksums
 sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-keyring/python-keyring.mk b/package/python-keyring/python-keyring.mk
index c1f124cb3e..766139f525 100644
--- a/package/python-keyring/python-keyring.mk
+++ b/package/python-keyring/python-keyring.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_KEYRING_VERSION = 23.11.0
+PYTHON_KEYRING_VERSION = 23.13.1
 PYTHON_KEYRING_SOURCE = keyring-$(PYTHON_KEYRING_VERSION).tar.gz
-PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/1c/35/c22960f14f5e17384296b2f09da259f8b5244fb3831eccec71cf948a49c6
+PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/55/fe/282f4c205add8e8bb3a1635cbbac59d6def2e0891b145aa553a0e40dd2d0
 PYTHON_KEYRING_SETUP_TYPE = setuptools
 PYTHON_KEYRING_LICENSE = MIT
 PYTHON_KEYRING_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
