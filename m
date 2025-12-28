Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F4BE8FDBE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 972C980E87;
	Sun, 28 Dec 2025 22:07:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u1YwkKowYJvl; Sun, 28 Dec 2025 22:07:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A950180E93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766959624;
	bh=0Yg3OvaDw5IV0j6mOcbiCaYVppkZFv7dbCakRcwf5RE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rhuyKtlSK790CjIp6Z9tbVMj9IYjIr6vDVzqNm6/G09uxwzoWz+UV7ASc9wqM6d+O
	 LcQ8oOalDzU/ElsTXSms+m0WI7zgWBAWBUtHmeektht06mDMUqUPfb6fPwsbQR503U
	 uyUOs63Xl1KpOfk5B9AcU76rqt9kd/E7eRqKYlETaxepauPlVki5kHENf/nuW6aXNQ
	 0RZVLQRueBLZFTE+9W6KlONNsTzr9ub/m0WVF0oG9a9O63gaAGkzRs653s5sPOmF5o
	 DfZZQB5UcBYQEQPJhijoAJbF3ZpC2Dfoaa6tMZDs328r36TaaLn0oWI2F0I+ngxDSi
	 Gkfas7AzVIdZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A950180E93;
	Sun, 28 Dec 2025 22:07:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3014ED8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B38FE80DEB
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4GpNqUTzfUcm for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7573B80DE6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7573B80DE6
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73903877A5; Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 23:02:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b7399336e1e8e02a8c7976964d35033e2680cbe
X-Git-Newrev: 84536c14986ab9f2de93d76a220a06d962134552
X-Patchwork-Hint: ignore
Message-Id: <20251228220645.73903877A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ipython-genutils: update
 tarball URL
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=84536c14986ab9f2de93d76a220a06d962134552
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-ipython-genutils/python-ipython-genutils.hash | 4 ++--
 package/python-ipython-genutils/python-ipython-genutils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-ipython-genutils/python-ipython-genutils.hash b/package/python-ipython-genutils/python-ipython-genutils.hash
index fd719c93a0..c368272f07 100644
--- a/package/python-ipython-genutils/python-ipython-genutils.hash
+++ b/package/python-ipython-genutils/python-ipython-genutils.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/ipython_genutils/json
+# md5, sha256 from https://pypi.org/pypi/ipython-genutils/json
 md5  5a4f9781f78466da0ea1a648f3e1f79f  ipython_genutils-0.2.0.tar.gz
-# Locally computed
 sha256  eb2e116e75ecef9d4d228fdc66af54269afa26ab4463042e33785b887c628ba8  ipython_genutils-0.2.0.tar.gz
+# Locally computed
 sha256  f09da6c0f4971485f6fbd6c630d0d6cdd012bfe128b2ebbd014de2f6c7c7e2a6  COPYING.md
diff --git a/package/python-ipython-genutils/python-ipython-genutils.mk b/package/python-ipython-genutils/python-ipython-genutils.mk
index 08a0b8ba9a..847279b6b4 100644
--- a/package/python-ipython-genutils/python-ipython-genutils.mk
+++ b/package/python-ipython-genutils/python-ipython-genutils.mk
@@ -6,7 +6,7 @@
 
 PYTHON_IPYTHON_GENUTILS_VERSION = 0.2.0
 PYTHON_IPYTHON_GENUTILS_SOURCE = ipython_genutils-$(PYTHON_IPYTHON_GENUTILS_VERSION).tar.gz
-PYTHON_IPYTHON_GENUTILS_SITE = https://pypi.python.org/packages/e8/69/fbeffffc05236398ebfcfb512b6d2511c622871dca1746361006da310399
+PYTHON_IPYTHON_GENUTILS_SITE = https://files.pythonhosted.org/packages/e8/69/fbeffffc05236398ebfcfb512b6d2511c622871dca1746361006da310399
 PYTHON_IPYTHON_GENUTILS_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_GENUTILS_LICENSE_FILES = COPYING.md
 PYTHON_IPYTHON_GENUTILS_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
