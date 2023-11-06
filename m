Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2014C4167B
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 13:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C77A4034F;
	Mon,  6 Nov 2023 13:19:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C77A4034F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c1TzjLUAQ1xB; Mon,  6 Nov 2023 13:19:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63308402DE;
	Mon,  6 Nov 2023 13:19:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63308402DE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 187811BF2EA
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 13:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5759414B7
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 13:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5759414B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lb3y1gmHybWO for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 13:19:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFE084000B
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 13:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFE084000B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD6D78690F; Mon,  6 Nov 2023 13:19:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 13:37:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cae00fe78395ca981526f31e14d7c508b81f1d65
X-Git-Newrev: 6f10cd7f8fda3f67d24520575dda3eb19c468b1f
X-Patchwork-Hint: ignore
Message-Id: <20231106131913.CD6D78690F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-async-lru: bump to version
 2.0.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=6f10cd7f8fda3f67d24520575dda3eb19c468b1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-async-lru/python-async-lru.hash | 4 ++--
 package/python-async-lru/python-async-lru.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-async-lru/python-async-lru.hash b/package/python-async-lru/python-async-lru.hash
index c6f11aff1d..0a7cd03be9 100644
--- a/package/python-async-lru/python-async-lru.hash
+++ b/package/python-async-lru/python-async-lru.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/async-lru/json
-md5  825ff7d35d1cd76f1b1ae44f38bf69f5  async-lru-2.0.2.tar.gz
-sha256  3b87ec4f2460c52cc7916a0138cc606b584c75d1ef7d661853c95d1d3acb869a  async-lru-2.0.2.tar.gz
+md5  cd57e4d7f51bcbe2b940c523a5851b40  async-lru-2.0.4.tar.gz
+sha256  b8a59a5df60805ff63220b2a0c5b5393da5521b113cd5465a44eb037d81a5627  async-lru-2.0.4.tar.gz
 # Locally computed sha256 checksums
 sha256  ea65975679bc2093be925d520358e41096bd96fddedee3e929160a5faadcf573  LICENSE
diff --git a/package/python-async-lru/python-async-lru.mk b/package/python-async-lru/python-async-lru.mk
index d707249e29..16c6a32ffd 100644
--- a/package/python-async-lru/python-async-lru.mk
+++ b/package/python-async-lru/python-async-lru.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNC_LRU_VERSION = 2.0.2
+PYTHON_ASYNC_LRU_VERSION = 2.0.4
 PYTHON_ASYNC_LRU_SOURCE = async-lru-$(PYTHON_ASYNC_LRU_VERSION).tar.gz
-PYTHON_ASYNC_LRU_SITE = https://files.pythonhosted.org/packages/92/16/be197573adca3d584dbd64d508488e95e36324ea036d751564d2f88d74bf
+PYTHON_ASYNC_LRU_SITE = https://files.pythonhosted.org/packages/80/e2/2b4651eff771f6fd900d233e175ddc5e2be502c7eb62c0c42f975c6d36cd
 PYTHON_ASYNC_LRU_SETUP_TYPE = setuptools
 PYTHON_ASYNC_LRU_LICENSE = MIT
 PYTHON_ASYNC_LRU_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
