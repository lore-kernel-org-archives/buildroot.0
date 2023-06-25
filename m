Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB282EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 13:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5779B81F08;
	Sun, 25 Jun 2023 13:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5779B81F08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y13VkNFGReIs; Sun, 25 Jun 2023 13:55:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8690C81F00;
	Sun, 25 Jun 2023 13:55:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8690C81F00
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D6CB1BF3BA
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FB7A40102
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:54:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FB7A40102
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RJQ4LX9iH569 for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 13:54:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B42E140364
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 13:54:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B42E140364
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98C2084A16; Sun, 25 Jun 2023 13:54:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 15:40:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 592b66b30a13813b09ec2672bc8ba7b941a9f2f3
X-Git-Newrev: 9ab02a6ba7d1fe439ba8c7d9f55a77a0b895f588
X-Patchwork-Hint: ignore
Message-Id: <20230625135415.98C2084A16@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pytest-asyncio: bump to
 version 0.21.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9ab02a6ba7d1fe439ba8c7d9f55a77a0b895f588
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-pytest-asyncio/python-pytest-asyncio.hash | 4 ++--
 package/python-pytest-asyncio/python-pytest-asyncio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.hash b/package/python-pytest-asyncio/python-pytest-asyncio.hash
index 051670aa51..6198a46608 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.hash
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest-asyncio/json
-md5  dce438c7b0081d7f580b5a79d7105570  pytest-asyncio-0.20.3.tar.gz
-sha256  83cbf01169ce3e8eb71c6c278ccb0574d1a7a3bb8eaaf5e50e0ad342afb33b36  pytest-asyncio-0.20.3.tar.gz
+md5  805da62a533c75a9bccadee485f98c27  pytest-asyncio-0.21.0.tar.gz
+sha256  2b38a496aef56f56b0e87557ec313e11e1ab9276fc3863f6a7be0f1d0e415e1b  pytest-asyncio-0.21.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a8ad31b1c3f40dca5a84119351b8fa8ddc868edd77fad8a8ebf6d8f2d16fa4ae  LICENSE
diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.mk b/package/python-pytest-asyncio/python-pytest-asyncio.mk
index c94c9ea876..6bf7e33577 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.mk
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_ASYNCIO_VERSION = 0.20.3
+PYTHON_PYTEST_ASYNCIO_VERSION = 0.21.0
 PYTHON_PYTEST_ASYNCIO_SOURCE = pytest-asyncio-$(PYTHON_PYTEST_ASYNCIO_VERSION).tar.gz
-PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/6e/06/38b0ca5d53582bb49697626975b5540435ea064762d852b5c66646c729e9
+PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/85/c7/9db0c6215f12f26b590c24acc96d048e03989315f198454540dff95109cd
 PYTHON_PYTEST_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_PYTEST_ASYNCIO_LICENSE = Apache-2.0
 PYTHON_PYTEST_ASYNCIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
