Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D54E71068
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 12:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4054983AA8;
	Thu, 21 Sep 2023 12:57:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4054983AA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V8MEE3YAyA1J; Thu, 21 Sep 2023 12:57:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B3B983A93;
	Thu, 21 Sep 2023 12:57:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B3B983A93
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F6271BF3AD
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 12:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6617B83A93
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 12:57:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6617B83A93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uTb3lPKQWM6P for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 12:57:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 841FE81FE4
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 12:57:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 841FE81FE4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BE8E87468; Thu, 21 Sep 2023 12:57:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 14:52:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51c497c90fb4fb009338d223f669fb47f4900e39
X-Git-Newrev: 1defedaf0bfdab6da63b52f4fd9b38cd19af19a4
X-Patchwork-Hint: ignore
Message-Id: <20230921125734.5BE8E87468@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pillow: bump to version
 10.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=1defedaf0bfdab6da63b52f4fd9b38cd19af19a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pillow/python-pillow.hash | 4 ++--
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index bca66a7436..c2c5125678 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  2a8f327ba2250aad26ed101337c8fa56  Pillow-10.0.0.tar.gz
-sha256  9c82b5b3e043c7af0d95792d0d20ccf68f61a1fec6b3530e718b688422727396  Pillow-10.0.0.tar.gz
+md5  93a0585ab0ee9717a7576129bdabdf93  Pillow-10.0.1.tar.gz
+sha256  d72967b06be9300fed5cfbc8b5bafceec48bf7cdc7dab66b1d2549035287191d  Pillow-10.0.1.tar.gz
 
 # Locally computed sha256 checksums
 sha256  0fdb68ffb39062553be40be4e6eaea9700b4f5e870a720ae86b8925d67613ddd  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 95a67f304e..d9f6fba861 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 10.0.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/0f/8b/2ebaf9adcf4260c00f842154865f8730cf745906aa5dd499141fb6063e26
+PYTHON_PILLOW_VERSION = 10.0.1
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/64/9e/7e638579cce7dc346632f020914141a164a872be813481f058883ee8d421
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
