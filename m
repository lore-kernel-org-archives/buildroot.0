Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD26FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 13:10:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 805DA611F0
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 13:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 805DA611F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CC4D60724;
	Sun, 19 Sep 2021 13:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j4iUTmlnV7Px; Sun, 19 Sep 2021 13:10:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A28286076F;
	Sun, 19 Sep 2021 13:10:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C2111BF95D
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 13:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B03E840A6
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 13:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KL6A3-j5zZiS for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 13:08:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F095F84087
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 13:08:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 69F678B7F2; Sun, 19 Sep 2021 13:06:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 15:03:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a6ccb7c28de3eb088c7e91dc2f43628e3f6768ac
X-Git-Newrev: dc95693ddf35d99e6f3e8a95bd3a96be06461417
X-Patchwork-Hint: ignore
Message-Id: <20210919130650.69F678B7F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bitstring: bump to version
 3.1.9
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dc95693ddf35d99e6f3e8a95bd3a96be06461417
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License updated with a minor change at the copyright year.
SETUP_TYPE changed to setuptools.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-bitstring/python-bitstring.hash | 6 +++---
 package/python-bitstring/python-bitstring.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-bitstring/python-bitstring.hash b/package/python-bitstring/python-bitstring.hash
index 04e4914696..f05619a5d3 100644
--- a/package/python-bitstring/python-bitstring.hash
+++ b/package/python-bitstring/python-bitstring.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bitstring/json
-md5  18661a3e5c47c59bd926dd0fefae0baa  bitstring-3.1.7.tar.gz
-sha256  fdf3eb72b229d2864fb507f8f42b1b2c57af7ce5fec035972f9566de440a864a  bitstring-3.1.7.tar.gz
+md5  04d24380a0dc491e6bdacd983a90912e  bitstring-3.1.9.tar.gz
+sha256  a5848a3f63111785224dca8bb4c0a75b62ecdef56a042c8d6be74b16f7e860e7  bitstring-3.1.9.tar.gz
 # Locally computed sha256 checksums
-sha256  ea3c0e2288994d3dfeaac0fd2163f2cf5f9671c3ae70a9e9d563795e28cfb0b9  LICENSE
+sha256  a9e9c584106d4f9686c9a6aa036e507b5e7044633b8acb4365bc074d8d004711  LICENSE
diff --git a/package/python-bitstring/python-bitstring.mk b/package/python-bitstring/python-bitstring.mk
index c36993416d..ff59487540 100644
--- a/package/python-bitstring/python-bitstring.mk
+++ b/package/python-bitstring/python-bitstring.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_BITSTRING_VERSION = 3.1.7
+PYTHON_BITSTRING_VERSION = 3.1.9
 PYTHON_BITSTRING_SOURCE = bitstring-$(PYTHON_BITSTRING_VERSION).tar.gz
-PYTHON_BITSTRING_SITE = https://files.pythonhosted.org/packages/c3/fc/ffac2c199d2efe1ec5111f55efeb78f5f2972456df6939fea849f103f9f5
-PYTHON_BITSTRING_SETUP_TYPE = distutils
+PYTHON_BITSTRING_SITE = https://files.pythonhosted.org/packages/4c/b1/80d58eeb21c9d4ca739770558d61f6adacb13aa4908f4f55e0974cbd25ee
+PYTHON_BITSTRING_SETUP_TYPE = setuptools
 PYTHON_BITSTRING_LICENSE = MIT
 PYTHON_BITSTRING_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
