Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45958C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F377D418FF;
	Mon,  4 Dec 2023 20:20:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F377D418FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HNNIxiyudxjz; Mon,  4 Dec 2023 20:20:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3684141821;
	Mon,  4 Dec 2023 20:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3684141821
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 24E8E1BF97A
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E725680BFE
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E725680BFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rPfzq_O89QEI for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BB7080C4B
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BB7080C4B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BE9D879B9; Mon,  4 Dec 2023 20:13:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 12:25:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47d43fe906c4f0ce5eed14ee1affd846fbae4be2
X-Git-Newrev: 35744a2c0265d88f1264629f041e1676a0e99f32
X-Patchwork-Hint: ignore
Message-Id: <20231204201328.3BE9D879B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-periphery: bump to version
 2.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=35744a2c0265d88f1264629f041e1676a0e99f32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to year update:
https://github.com/vsergeev/python-periphery/commit/c0e6741ee294fb9362ddc4b60088f18bb1c27f8d

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-periphery/python-periphery.hash | 8 +++++---
 package/python-periphery/python-periphery.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-periphery/python-periphery.hash b/package/python-periphery/python-periphery.hash
index 24e104d3ad..a758fa7a4d 100644
--- a/package/python-periphery/python-periphery.hash
+++ b/package/python-periphery/python-periphery.hash
@@ -1,3 +1,5 @@
-# Locally calculated
-sha256  385716bdbd11fcf2c5728548c3d42f12ebc0974faa64fa1a98b89b4a44dc004c  python-periphery-2.3.0.tar.gz
-sha256  76fe342043adfe8d9453c4979aa165476875137e15b0ddea1f4c3f3fa9808361  LICENSE
+# md5, sha256 from https://pypi.org/pypi/python-periphery/json
+md5  2b2a1037fb4ac15e7b0514ce3659d26c  python-periphery-2.4.1.tar.gz
+sha256  61d461d736982a6f766e878720ab10a68151e2e8c1086600d9389ac47e40e88a  python-periphery-2.4.1.tar.gz
+# Locally computed sha256 checksums
+sha256  321124461e9f86f4f7bb9f571500bf58ec1b76206b642e505ce17db7f7c88e05  LICENSE
diff --git a/package/python-periphery/python-periphery.mk b/package/python-periphery/python-periphery.mk
index 2c533fa2c2..7a49f305a5 100644
--- a/package/python-periphery/python-periphery.mk
+++ b/package/python-periphery/python-periphery.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PERIPHERY_VERSION = 2.3.0
-PYTHON_PERIPHERY_SITE = $(call github,vsergeev,python-periphery,v$(PYTHON_PERIPHERY_VERSION))
+PYTHON_PERIPHERY_VERSION = 2.4.1
+PYTHON_PERIPHERY_SITE = https://files.pythonhosted.org/packages/df/f1/1a986ad2bb696033168db2121151e5ff90df033af780ffca47c8bb559f29
 PYTHON_PERIPHERY_LICENSE = MIT
 PYTHON_PERIPHERY_LICENSE_FILES = LICENSE
 PYTHON_PERIPHERY_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
