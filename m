Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CABC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 13:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCCBF41F56;
	Mon,  6 Nov 2023 13:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCCBF41F56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 90e7kBNjvD0Q; Mon,  6 Nov 2023 13:19:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2DD841EA0;
	Mon,  6 Nov 2023 13:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2DD841EA0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE3DF1BF2EA
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 13:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97DC261183
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 13:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97DC261183
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a_EA73ME0wr8 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 13:19:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D58FF60AE7
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 13:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D58FF60AE7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C38F28690E; Mon,  6 Nov 2023 13:19:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 13:36:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b398c5a2103906a9df392071d86e70a66a9fa7ba
X-Git-Newrev: cae00fe78395ca981526f31e14d7c508b81f1d65
X-Patchwork-Hint: ignore
Message-Id: <20231106131913.C38F28690E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-asttokens: bump to version
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

commit: https://git.buildroot.net/buildroot/commit/?id=cae00fe78395ca981526f31e14d7c508b81f1d65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-asttokens/python-asttokens.hash | 4 ++--
 package/python-asttokens/python-asttokens.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asttokens/python-asttokens.hash b/package/python-asttokens/python-asttokens.hash
index 6529e4db41..9042c3002d 100644
--- a/package/python-asttokens/python-asttokens.hash
+++ b/package/python-asttokens/python-asttokens.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asttokens/json
-md5  a9ae6ae0f85398e511bcb9ec87695eed  asttokens-2.2.1.tar.gz
-sha256  4622110b2a6f30b77e1473affaa97e711bc2f07d3f10848420ff1898edbe94f3  asttokens-2.2.1.tar.gz
+md5  c353679585a40f43c24ca60fca33bbf6  asttokens-2.4.1.tar.gz
+sha256  b03869718ba9a6eb027e134bfdf69f38a236d681c83c160d510768af11254ba0  asttokens-2.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/python-asttokens/python-asttokens.mk b/package/python-asttokens/python-asttokens.mk
index 8a8ce1ddd9..4806d17915 100644
--- a/package/python-asttokens/python-asttokens.mk
+++ b/package/python-asttokens/python-asttokens.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASTTOKENS_VERSION = 2.2.1
+PYTHON_ASTTOKENS_VERSION = 2.4.1
 PYTHON_ASTTOKENS_SOURCE = asttokens-$(PYTHON_ASTTOKENS_VERSION).tar.gz
-PYTHON_ASTTOKENS_SITE = https://files.pythonhosted.org/packages/c8/e3/b0b4f32162621126fbdaba636c152c6b6baec486c99f48686e66343d638f
+PYTHON_ASTTOKENS_SITE = https://files.pythonhosted.org/packages/45/1d/f03bcb60c4a3212e15f99a56085d93093a497718adf828d050b9d675da81
 PYTHON_ASTTOKENS_SETUP_TYPE = setuptools
 PYTHON_ASTTOKENS_LICENSE = Apache-2.0
 PYTHON_ASTTOKENS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
