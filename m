Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F32C433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:48:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B718608FB
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B718608FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2680400C5;
	Wed,  3 Nov 2021 17:48:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZQsQEqx3IbM2; Wed,  3 Nov 2021 17:48:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBF8C401E9;
	Wed,  3 Nov 2021 17:48:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 677301BF85D
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 645766063E
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:48:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yIKUgJgNmAd2 for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 17:48:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A5FB60630
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 17:48:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 523688A396; Wed,  3 Nov 2021 17:44:47 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 18:47:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b31b4b9cef2f959915128babc5c00354f9e949f
X-Git-Newrev: 22abc0cf45354fbd1850924c946de30ccc48e011
X-Patchwork-Hint: ignore
Message-Id: <20211103174447.523688A396@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-yarl: bump to version 1.7.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=22abc0cf45354fbd1850924c946de30ccc48e011
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-yarl/python-yarl.hash | 4 ++--
 package/python-yarl/python-yarl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-yarl/python-yarl.hash b/package/python-yarl/python-yarl.hash
index e488ee6939..bf971e9a9a 100644
--- a/package/python-yarl/python-yarl.hash
+++ b/package/python-yarl/python-yarl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/yarl/json
-md5  624ac1cd36abe92dc437fa97209c5c68  yarl-1.7.0.tar.gz
-sha256  8e7ebaf62e19c2feb097ffb7c94deb0f0c9fab52590784c8cd679d30ab009162  yarl-1.7.0.tar.gz
+md5  acd3eb25a9c46b10a699a3bee5fb9777  yarl-1.7.2.tar.gz
+sha256  45399b46d60c253327a460e99856752009fcee5f5d3c80b2f7c0cae1c38d56dd  yarl-1.7.2.tar.gz
 # Locally computed sha256 checksums
 sha256  56d6ac6c8105c0a51304c21db060e361af9a8ea0af9a75c239c28b5d13693838  LICENSE
diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
index 8a1a3bbca0..175aaa7a35 100644
--- a/package/python-yarl/python-yarl.mk
+++ b/package/python-yarl/python-yarl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YARL_VERSION = 1.7.0
+PYTHON_YARL_VERSION = 1.7.2
 PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
-PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/7f/5c/a4ce6d4f46413afe49734bf901939105f4ce7fcfbcf87d0777cc39501060
+PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/f6/da/46d1b3d69a9a0835dabf9d59c7eb0f1600599edd421a4c5a15ab09f527e0
 PYTHON_YARL_LICENSE = Apache-2.0
 PYTHON_YARL_LICENSE_FILES = LICENSE
 PYTHON_YARL_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
