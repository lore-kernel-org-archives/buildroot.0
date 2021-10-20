Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A69F1C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 21:35:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DA636128B
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 21:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1DA636128B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9B0D825B1;
	Wed, 20 Oct 2021 21:35:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fXUQHM9KPoTX; Wed, 20 Oct 2021 21:35:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5655782540;
	Wed, 20 Oct 2021 21:35:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 561711BF2C2
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 21:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45DCE60BC2
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 21:35:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D5AEX5BYgGwU for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 21:35:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B83160BBB
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 21:35:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8520D8815C; Wed, 20 Oct 2021 21:31:58 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 20 Oct 2021 23:34:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b97696a2d26b1e88fcc982b2f15894fe97d97fe6
X-Git-Newrev: ffefa118819abe1870980ae233c514f8974031e2
X-Patchwork-Hint: ignore
Message-Id: <20211020213158.8520D8815C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyjwt: bump to version 2.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ffefa118819abe1870980ae233c514f8974031e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyjwt/python-pyjwt.hash | 4 ++--
 package/python-pyjwt/python-pyjwt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyjwt/python-pyjwt.hash b/package/python-pyjwt/python-pyjwt.hash
index 6bfbe05bf9..5ea6c0cd50 100644
--- a/package/python-pyjwt/python-pyjwt.hash
+++ b/package/python-pyjwt/python-pyjwt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/PyJWT/json
-md5  c7c5b05a1dcee1fac0dc13fea892ed86  PyJWT-2.2.0.tar.gz
-sha256  a0b9a3b4e5ca5517cac9f1a6e9cd30bf1aa80be74fcdf4e28eded582ecfcfbae  PyJWT-2.2.0.tar.gz
+md5  60cf2d463157bf21eb37be0430521036  PyJWT-2.3.0.tar.gz
+sha256  b888b4d56f06f6dcd777210c334e69c737be74755d3e5e9ee3fe67dc18a0ee41  PyJWT-2.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ec82af815b5f9da8685afb300cc5beb7949e1c22b79b6c1c054796cefdf6cac6  LICENSE
diff --git a/package/python-pyjwt/python-pyjwt.mk b/package/python-pyjwt/python-pyjwt.mk
index 123f12ef69..ba8130e7ca 100644
--- a/package/python-pyjwt/python-pyjwt.mk
+++ b/package/python-pyjwt/python-pyjwt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYJWT_VERSION = 2.2.0
+PYTHON_PYJWT_VERSION = 2.3.0
 PYTHON_PYJWT_SOURCE = PyJWT-$(PYTHON_PYJWT_VERSION).tar.gz
-PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/b9/6d/e5ac4eb80724cb4201de6dcbc1e8a9f5cb65a0424b30c4c69e49bc1363d1
+PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/1d/8e/01bdcfdbb352daaba8ea406d9df149c5bba7dbf70f908d4fa4c269fe6a08
 PYTHON_PYJWT_SETUP_TYPE = setuptools
 PYTHON_PYJWT_LICENSE = MIT
 PYTHON_PYJWT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
