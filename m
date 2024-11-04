Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8A1D1BDED
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 20:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18950810A1;
	Mon,  4 Nov 2024 20:42:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qb5R3GljbARe; Mon,  4 Nov 2024 20:42:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C93798102F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C93798102F;
	Mon,  4 Nov 2024 20:42:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0505D3B
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07F6B40574
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5vEYPoOwvzXh for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 20:42:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD3F640576
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD3F640576
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:42:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9ADA85AAC; Mon,  4 Nov 2024 20:42:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 4 Nov 2024 21:39:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5a722626d77be3c6d38da474cbb43262abc355b7
X-Git-Newrev: bc12b27795f554f14a4c1913450c0578bf2ed97a
X-Patchwork-Hint: ignore
Message-Id: <20241104204204.D9ADA85AAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-m2crypto: bump to version
 0.43.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bc12b27795f554f14a4c1913450c0578bf2ed97a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-m2crypto/python-m2crypto.hash | 4 ++--
 package/python-m2crypto/python-m2crypto.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-m2crypto/python-m2crypto.hash b/package/python-m2crypto/python-m2crypto.hash
index aa8fe09c14..98307af0cf 100644
--- a/package/python-m2crypto/python-m2crypto.hash
+++ b/package/python-m2crypto/python-m2crypto.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/m2crypto/json
-md5  b88bcb1d4aeb817f91eb627d08b673a2  m2crypto-0.42.0.tar.gz
-sha256  42b62df2caf623161b1d643a7235464c2fe2a3105049ebc498a6d47dc08f64b4  m2crypto-0.42.0.tar.gz
+md5  75c50150857eb60e4f447b04d13ff507  m2crypto-0.43.0.tar.gz
+sha256  6c2c1c7bb0e8aa768f7ca803da7dbc2666d4003b26bd7adf70233afc59d8cf33  m2crypto-0.43.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4eca478396f4b2b020729a111fce3f096456d74500bfd8f2b0388c3c69f997c0  LICENCE
diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
index 79dfc1beb2..b5142c9bb2 100644
--- a/package/python-m2crypto/python-m2crypto.mk
+++ b/package/python-m2crypto/python-m2crypto.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_M2CRYPTO_VERSION = 0.42.0
+PYTHON_M2CRYPTO_VERSION = 0.43.0
 PYTHON_M2CRYPTO_SOURCE = m2crypto-$(PYTHON_M2CRYPTO_VERSION).tar.gz
-PYTHON_M2CRYPTO_SITE = https://files.pythonhosted.org/packages/85/9f/b8977ce2971cf5f823db3fdb31e7e061b9662da318a17b6bf0c653f84aee
+PYTHON_M2CRYPTO_SITE = https://files.pythonhosted.org/packages/ff/1b/4771f0ecfdd9df6752ae5d0cf040545bb3cfe8a504af87e05c9ac4a6a499
 PYTHON_M2CRYPTO_SETUP_TYPE = setuptools
 PYTHON_M2CRYPTO_LICENSE = MIT
 PYTHON_M2CRYPTO_LICENSE_FILES = LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
