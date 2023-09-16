Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32071CD37BB
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 12:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBC3681521;
	Sat, 16 Sep 2023 12:35:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBC3681521
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pi984rMHTHIO; Sat, 16 Sep 2023 12:35:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBCBF81DE3;
	Sat, 16 Sep 2023 12:34:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBCBF81DE3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 720641BF861
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 12:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BF0E6103A
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 12:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BF0E6103A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tn_DCjOF6zkW for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 12:34:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70E4460EE3
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 12:34:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70E4460EE3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F2DA87038; Sat, 16 Sep 2023 12:34:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 14:33:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5f782ebdd6512b5f76f6e956ae4d3f2710200e0
X-Git-Newrev: 13d1ce72debcfe0fbe66f3379638799d4d14e7bf
X-Patchwork-Hint: ignore
Message-Id: <20230916123445.5F2DA87038@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pytest-asyncio: bump to
 version 0.21.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=13d1ce72debcfe0fbe66f3379638799d4d14e7bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pytest-asyncio/python-pytest-asyncio.hash | 4 ++--
 package/python-pytest-asyncio/python-pytest-asyncio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.hash b/package/python-pytest-asyncio/python-pytest-asyncio.hash
index 6198a46608..f6cc1d2413 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.hash
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest-asyncio/json
-md5  805da62a533c75a9bccadee485f98c27  pytest-asyncio-0.21.0.tar.gz
-sha256  2b38a496aef56f56b0e87557ec313e11e1ab9276fc3863f6a7be0f1d0e415e1b  pytest-asyncio-0.21.0.tar.gz
+md5  1d10f607444a375c1425a2a90960006e  pytest-asyncio-0.21.1.tar.gz
+sha256  40a7eae6dded22c7b604986855ea48400ab15b069ae38116e8c01238e9eeb64d  pytest-asyncio-0.21.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a8ad31b1c3f40dca5a84119351b8fa8ddc868edd77fad8a8ebf6d8f2d16fa4ae  LICENSE
diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.mk b/package/python-pytest-asyncio/python-pytest-asyncio.mk
index 6bf7e33577..5c5efd819c 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.mk
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_ASYNCIO_VERSION = 0.21.0
+PYTHON_PYTEST_ASYNCIO_VERSION = 0.21.1
 PYTHON_PYTEST_ASYNCIO_SOURCE = pytest-asyncio-$(PYTHON_PYTEST_ASYNCIO_VERSION).tar.gz
-PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/85/c7/9db0c6215f12f26b590c24acc96d048e03989315f198454540dff95109cd
+PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/5a/85/d39ef5f69d5597a206f213ce387bcdfa47922423875829f7a98a87d33281
 PYTHON_PYTEST_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_PYTEST_ASYNCIO_LICENSE = Apache-2.0
 PYTHON_PYTEST_ASYNCIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
